



CREATE PROCEDURE [dwh].[sp_stg_dw_dim_member]
@RUN_INSTANCE_SKEY INT , 
@UPDATE_COUNT INT OUTPUT,
@INSERT_COUNT INT OUTPUT,
@STATUS INT OUTPUT
AS

BEGIN

BEGIN TRY

BEGIN TRANSACTION

DROP TABLE IF EXISTS #stg_tmp_member

SELECT
		STG.[member_skey]
      ,STG.[member_key]
      ,STG.[group_nbr]
      ,STG.[section_nbr]
      ,STG.[subscriber_id]
      ,STG.[contract_type]
      ,STG.[product_type]
      ,STG.[product_line]
      ,STG.[run_instance_skey]
      ,STG.[source_file_skey]
      ,STG.[client_name]
      ,STG.[carrier_name]

INTO #stg_tmp_member

FROM
		[stg].[tbl_member]	 STG 
WHERE
		STG.[run_instance_skey]=@RUN_INSTANCE_SKEY


DROP TABLE IF EXISTS #temp_member

--------FINDING MATCHED/UNMATCHED RECORDS AND PUSHING INTO TEMP TABLE--------

SELECT
		STG.[member_skey]
      ,STG.[member_key]
      ,STG.[group_nbr]
      ,STG.[section_nbr]
      ,STG.[subscriber_id]
      ,STG.[contract_type]
      ,STG.[product_type]
      ,STG.[product_line]
      ,STG.[run_instance_skey]
	  ,STG.[source_file_skey]
      ,STG.[client_name]
      ,STG.[carrier_name]
  ,IIF(DW.member_key IS NULL,'INSERT','UPDATE') AS to_do    --IF MATCH FOUND UPDATE ELSE INSERT

INTO #temp_member

FROM
		#stg_tmp_member	 STG 
LEFT JOIN 
		[dwh].[dim_tbl_member] DW
ON 
		STG.member_key=DW.member_key and
		STG.carrier_name = DW.carrier_name and
		STG.client_name = DW.client_name
WHERE
		STG.run_instance_skey=@RUN_INSTANCE_SKEY
  

---------UPDATE FOR MATCHED RECORDS----------

UPDATE DW
SET
	   DW.[member_skey] = STG.[member_skey]
      ,DW.[group_nbr]  = STG.[group_nbr]
      ,DW.[section_nbr] = STG.[section_nbr]
      ,DW.[subscriber_id] = STG.[subscriber_id]
      ,DW.[contract_type] = STG.[contract_type]
      ,DW.[product_type] = STG.[product_type]
      ,DW.[product_line] = STG.[product_line]
      ,DW.[run_instance_skey] = STG.[run_instance_skey]
	  ,DW.[source_file_skey] = STG.[source_file_skey]
	  ,DW.[dw_updated_timestamp] = getdate()
FROM
	[dwh].[dim_tbl_member] DW
INNER JOIN
	#temp_member STG
ON DW.member_key = STG.member_key and
	STG.carrier_name = DW.carrier_name and
	STG.client_name = DW.client_name
WHERE STG.to_do = 'UPDATE'

  
------INSERT FOR UNMATCHED RECORDS----------

INSERT INTO [dwh].[dim_tbl_member]
(
		[member_skey]
	   ,[member_key]
	   ,[group_nbr]
	   ,[section_nbr]
	   ,[subscriber_id]
	   ,[contract_type]
	   ,[product_type]
	   ,[product_line]
	   ,[run_instance_skey]
	   ,[source_file_skey]
	   ,[client_name]
	   ,[carrier_name]
	   ,[dw_inserted_timestamp]
)
SELECT
		[member_skey]
	   ,[member_key]
	   ,[group_nbr]
	   ,[section_nbr]
	   ,[subscriber_id]
	   ,[contract_type]
	   ,[product_type]
	   ,[product_line]
	   ,[run_instance_skey]
	   ,[source_file_skey]
	   ,[client_name]
	   ,[carrier_name]
	   ,getdate()

FROM
		#temp_member
WHERE 
		to_do='INSERT'

SET @STATUS=1

COMMIT TRANSACTION

END TRY

 

BEGIN CATCH

	ROLLBACK TRANSACTION

	SELECT @UPDATE_COUNT=0,@INSERT_COUNT=0

	SET @STATUS=0   ---SETTING THE STATUS OF FAILURE

	DECLARE @ERROR_MSG VARCHAR(255)
	SELECT @ERROR_MSG=ERROR_MESSAGE() 

	-----UPDATE IN EXECUTION LOG THE ERROR MSG WHICH IS RUNNING-----

	UPDATE 
		[audit].[audit_job_process_execution_log]
	SET 
		message=@ERROR_MSG
	WHERE 
		load_status='IN_PROGRESS'

END CATCH
 
------------FETCHING UPDATE COUNT-------------
SELECT @UPDATE_COUNT=COUNT(*) FROM #temp_member WHERE to_do='UPDATE'

-----------FETCHING NEW INSERT COUNT-----------

SELECT @INSERT_COUNT=COUNT(*) FROM #temp_member WHERE to_do='INSERT'


END

