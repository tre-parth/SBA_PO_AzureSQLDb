



CREATE PROCEDURE [dwh].[sp_stg_dw_dim_provider]
@RUN_INSTANCE_SKEY INT , 
@UPDATE_COUNT INT OUTPUT,
@INSERT_COUNT INT OUTPUT,
@STATUS INT OUTPUT
AS

BEGIN

BEGIN TRY

BEGIN TRANSACTION

DROP TABLE IF EXISTS #stg_tmp_provider

SELECT
	STG.[servicing_provider_npi]
	,STG.[servicing_provider_name]
	,STG.[servicing_provider_city]
	,STG.[servicing_provider_street_address_1]
	,STG.[servicing_provider_street_address_2]
	,STG.[servicing_provider_state]
	,STG.[servicing_provider_zip_code]
	,STG.[servicing_provider_specialty_code]
	,STG.[servicing_provider_type]
	,STG.[servicing_provider_tax_id]
	,STG.[carrier]
	,STG.[client]
	,STG.[run_instance_skey]
	,STG.[source_file_skey]

INTO #stg_tmp_provider

FROM
		[stg].[tbl_medical_claim]	 STG 
WHERE
		STG.[run_instance_skey]=@RUN_INSTANCE_SKEY


DROP TABLE IF EXISTS #tmp_provider

--------FINDING MATCHED/UNMATCHED RECORDS AND PUSHING INTO TEMP TABLE--------

SELECT
	STG.[servicing_provider_npi]
	,STG.[servicing_provider_name]
	,STG.[servicing_provider_city]
	,STG.[servicing_provider_street_address_1]
	,STG.[servicing_provider_street_address_2]
	,STG.[servicing_provider_state]
	,STG.[servicing_provider_zip_code]
	,STG.[servicing_provider_specialty_code]
	,STG.[servicing_provider_type]
	,STG.[servicing_provider_tax_id]
	,STG.[carrier]
	,STG.[client]
	,STG.[run_instance_skey]
	,STG.[source_file_skey]
  ,IIF(DW.servicing_provider_npi IS NULL,'INSERT','UPDATE') AS to_do    --IF MATCH FOUND UPDATE ELSE INSERT

INTO #tmp_provider

FROM
		#stg_tmp_provider STG 
LEFT JOIN 
		[dwh].[dim_tbl_provider] DW
ON 
		STG.servicing_provider_npi=DW.provider_npi
WHERE
		STG.run_instance_skey=@RUN_INSTANCE_SKEY
  

---------UPDATE FOR MATCHED RECORDS----------

UPDATE DW
SET
	   DW.[provider_name] = STG.[servicing_provider_name]
      ,DW.[provider_city] = STG.[servicing_provider_city]
      ,DW.[provider_address1] = STG.[servicing_provider_street_address_1]
      ,DW.[provider_address2] = STG.[servicing_provider_street_address_2]
      ,DW.[provider_state] = STG.[servicing_provider_state]
      ,DW.[provider_zip] = STG.[servicing_provider_zip_code]
      ,DW.[provider_speciality_code] = STG.[servicing_provider_specialty_code]
	  ,DW.[provider_type] = STG.[servicing_provider_type]
	  ,DW.[provider_tin] = STG.[servicing_provider_tax_id]
	  ,DW.[run_instance_skey] = STG.[run_instance_skey]
	  ,DW.[source_file_skey] = STG.[source_file_skey]
	  ,DW.[dw_updated_timestamp] = getdate()
FROM
	[dwh].[dim_tbl_provider] DW
INNER JOIN
	#tmp_provider STG
ON DW.provider_npi = STG.servicing_provider_npi
WHERE STG.to_do = 'UPDATE'


  
------INSERT FOR UNMATCHED RECORDS----------

INSERT INTO [dwh].[dim_tbl_provider]
(
	   [provider_npi]
	   ,[provider_name]
	   ,[provider_city]
	   ,[provider_address1]
	   ,[provider_address2]
	   ,[provider_state]
	   ,[provider_zip]
	   ,[provider_speciality_code]
	   ,[provider_type]
	   ,[provider_tin]
	   ,[run_instance_skey]
	   ,[source_file_skey]
	   ,[dw_inserted_timestamp]
)
SELECT
	 [servicing_provider_npi]
	,[servicing_provider_name]
	,[servicing_provider_city]
	,[servicing_provider_street_address_1]
	,[servicing_provider_street_address_2]
	,[servicing_provider_state]
	,[servicing_provider_zip_code]
	,[servicing_provider_specialty_code]
	,[servicing_provider_type]
	,[servicing_provider_tax_id]
	,[run_instance_skey]
	,[source_file_skey]	   
	,getdate()

FROM
		#tmp_provider
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
SELECT @UPDATE_COUNT=COUNT(*) FROM #tmp_provider WHERE to_do='UPDATE'

-----------FETCHING NEW INSERT COUNT-----------

SELECT @INSERT_COUNT=COUNT(*) FROM #tmp_provider WHERE to_do='INSERT'


END

