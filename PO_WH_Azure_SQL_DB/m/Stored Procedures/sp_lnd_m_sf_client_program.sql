



CREATE PROCEDURE [m].[sp_lnd_m_sf_client_program]
@RUN_INSTANCE_SKEY INT , 
@UPDATE_COUNT INT OUTPUT,
@INSERT_COUNT INT OUTPUT,
@STATUS INT OUTPUT
AS

BEGIN

BEGIN TRY

BEGIN TRANSACTION

DROP TABLE IF EXISTS #land_tmp_client_program

SELECT
	 LND.[client_id]
	,LND.[client_name]
	,LND.[account_executive]
	,LND.[program_start_year]
	,LND.[termed_date]
	,LND.[sds_claims_analysis_due_date]
	,LND.[data_channel]
	,LND.[approved_communication_date]
	,LND.[po_active]
	,LND.[sds_hip]
	,LND.[sds_knee]
	,LND.[sds_lbp]
	,LND.[sds_uf]
	,LND.[sds_wls]
	,LND.[sds_claims_analysis]
	,LND.[bh]
	,LND.[cad]
	,LND.[cqp]
	,LND.[run_instance_skey]
	,LND.[source_file_skey]

INTO #land_tmp_client_program

FROM
		[land].[tbl_sf_client_program_info]	 LND 
WHERE
		LND.[run_instance_skey]=@RUN_INSTANCE_SKEY


DROP TABLE IF EXISTS #temp_client_program

--------FINDING MATCHED/UNMATCHED RECORDS AND PUSHING INTO TEMP TABLE--------

SELECT
	 LND.[client_id]
	,LND.[client_name]
	,LND.[account_executive]
	,LND.[program_start_year]
	,LND.[termed_date]
	,LND.[sds_claims_analysis_due_date]
	,LND.[data_channel]
	,LND.[approved_communication_date]
	,LND.[po_active]
	,LND.[sds_hip]
	,LND.[sds_knee]
	,LND.[sds_lbp]
	,LND.[sds_uf]
	,LND.[sds_wls]
	,LND.[sds_claims_analysis]
	,LND.[bh]
	,LND.[cad]
	,LND.[cqp]
	,LND.[run_instance_skey]
	,LND.[source_file_skey]
    ,IIF(M.client_id IS NULL,'ACTIVE','INACTIVE') AS to_do    --IF MATCH FOUND UPDATE ELSE INSERT

INTO #temp_client_program

FROM
		#land_tmp_client_program	 LND 
LEFT JOIN 
		[m].[tbl_sf_client_program_info] M
ON 
		LND.[client_id] = M.[client_id]
WHERE
		LND.run_instance_skey=@RUN_INSTANCE_SKEY
  

---------UPDATE FOR MATCHED RECORDS----------

UPDATE DW
SET
	   M.[active_flag] = 'INACTIVE'
	  ,M.[m_updated_timestamp] = getdate()
FROM
	[m].[tbl_sf_client_program_info] M
INNER JOIN
	#temp_client_program LND
ON LND.[client_id] = M.[client_id]
WHERE LND.to_do = 'INACTIVE'

  
------INSERT FOR UNMATCHED RECORDS----------

INSERT INTO [m].[tbl_sf_client_program_info]
(
     [client_id]
	,[client_name]
	,[account_executive]
	,[program_start_year]
	,[termed_date]
	,[sds_claims_analysis_due_date]
	,[data_channel]
	,[approved_communication_date]
	,[po_active]
	,[sds_hip]
	,[sds_knee]
	,[sds_lbp]
	,[sds_uf]
	,[sds_wls]
	,[sds_claims_analysis]
	,[bh]
	,[cad]
	,[cqp]
	,[active_flag]
	,[run_instance_skey]
	,[source_file_skey]
	,[m_inserted_timestamp]
)
SELECT
     [client_id]
	,[client_name]
	,[account_executive]
	,[program_start_year]
	,[termed_date]
	,[sds_claims_analysis_due_date]
	,[data_channel]
	,[approved_communication_date]
	,[po_active]
	,[sds_hip]
	,[sds_knee]
	,[sds_lbp]
	,[sds_uf]
	,[sds_wls]
	,[sds_claims_analysis]
	,[bh]
	,[cad]
	,[cqp]
	,'ACTIVE'
	,[run_instance_skey]
	,[source_file_skey]
  	,getdate()

FROM
		#temp_client_program


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
SELECT @UPDATE_COUNT=COUNT(*) FROM #temp_client_program WHERE to_do='INACTIVE'

-----------FETCHING NEW INSERT COUNT-----------

SELECT @INSERT_COUNT=COUNT(*) FROM #temp_client_program


END

