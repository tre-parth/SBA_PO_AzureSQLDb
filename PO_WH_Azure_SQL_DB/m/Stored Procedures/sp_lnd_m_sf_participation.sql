



CREATE PROCEDURE [m].[sp_lnd_m_sf_participation]
@RUN_INSTANCE_SKEY INT , 
@UPDATE_COUNT INT OUTPUT,
@INSERT_COUNT INT OUTPUT,
@STATUS INT OUTPUT
AS

BEGIN

BEGIN TRY

BEGIN TRANSACTION

DROP TABLE IF EXISTS #land_tmp_participation

SELECT
	 LND.[company]
	,LND.[client_last_name]
	,LND.[client_first_name]
	,LND.[rel_to_employee]
	,LND.[solucia_id]
	,LND.[intake_id]
	,LND.[client_dob]
	,LND.[client_gender]
	,LND.[home_phone]
	,LND.[work_phone]
	,LND.[cell_phone]
	,LND.[email]
	,LND.[street_address_1]
	,LND.[street_address_2]
	,LND.[city]
	,LND.[state]
	,LND.[zip_code]
	,LND.[enrolled_diagnosis]
	,LND.[employee_last_name]
	,LND.[employee_first_name]
	,LND.[referral_source]
	,LND.[integration_partner]
	,LND.[insurance_carrier]
	,LND.[intake_date]
	,LND.[cmr_program_type]
	,LND.[program_sub_type]
	,LND.[pre_opn]
	,LND.[pre_phy]
	,LND.[pre_smo]
	,LND.[pre_mis]
	,LND.[pre_med]
	,LND.[pre_lif]
	,LND.[pre_lip]
	,LND.[pre_ivs]
	,LND.[preintent_surgical_procedure]
	,LND.[postintent_surgical_procedure]
	,LND.[survey_completed]
	,LND.[survey_not_completed]
	,LND.[survey_result]
	,LND.[year_of_impact]
	,LND.[a]
	,LND.[b]
	,LND.[c]
	,LND.[d]
	,LND.[e]
	,LND.[f]
	,LND.[g]
	,LND.[h]
	,LND.[i]
	,LND.[j]
	,LND.[k]
	,LND.[no_impact]
	,LND.[impact_status_cmr]
	,LND.[post_med]
	,LND.[post_lif]
	,LND.[post_lip]
	,LND.[post_ivs]
	,LND.[post_mis]
	,LND.[source_file_skey]
	,LND.[run_instance_skey]

INTO #land_tmp_participation

FROM
		[land].[tbl_sf_participation] LND 
WHERE
		LND.[run_instance_skey]=@RUN_INSTANCE_SKEY


DROP TABLE IF EXISTS #temp_participation

--------FINDING MATCHED/UNMATCHED RECORDS AND PUSHING INTO TEMP TABLE--------

SELECT
	 LND.[company]
	,LND.[client_last_name]
	,LND.[client_first_name]
	,LND.[rel_to_employee]
	,LND.[solucia_id]
	,LND.[intake_id]
	,LND.[client_dob]
	,LND.[client_gender]
	,LND.[home_phone]
	,LND.[work_phone]
	,LND.[cell_phone]
	,LND.[email]
	,LND.[street_address_1]
	,LND.[street_address_2]
	,LND.[city]
	,LND.[state]
	,LND.[zip_code]
	,LND.[enrolled_diagnosis]
	,LND.[employee_last_name]
	,LND.[employee_first_name]
	,LND.[referral_source]
	,LND.[integration_partner]
	,LND.[insurance_carrier]
	,LND.[intake_date]
	,LND.[cmr_program_type]
	,LND.[program_sub_type]
	,LND.[pre_opn]
	,LND.[pre_phy]
	,LND.[pre_smo]
	,LND.[pre_mis]
	,LND.[pre_med]
	,LND.[pre_lif]
	,LND.[pre_lip]
	,LND.[pre_ivs]
	,LND.[preintent_surgical_procedure]
	,LND.[postintent_surgical_procedure]
	,LND.[survey_completed]
	,LND.[survey_not_completed]
	,LND.[survey_result]
	,LND.[year_of_impact]
	,LND.[a]
	,LND.[b]
	,LND.[c]
	,LND.[d]
	,LND.[e]
	,LND.[f]
	,LND.[g]
	,LND.[h]
	,LND.[i]
	,LND.[j]
	,LND.[k]
	,LND.[no_impact]
	,LND.[impact_status_cmr]
	,LND.[post_med]
	,LND.[post_lif]
	,LND.[post_lip]
	,LND.[post_ivs]
	,LND.[post_mis]
	,LND.[source_file_skey]
	,LND.[run_instance_skey]
    ,IIF(M.cmr_program_type IS NULL,'ACTIVE','INACTIVE') AS to_do    --IF MATCH FOUND UPDATE ELSE INSERT

INTO #temp_participation

FROM
		#land_tmp_participation	 LND 
LEFT JOIN 
		[m].[tbl_sf_participation] M
ON 
		LND.[company] = M.[company] and
		LND.[client_last_name] = M.[client_last_name] and
		LND.[client_first_name] = M.[client_first_name] and
		LND.[cmr_program_type] = M.[cmr_program_type]
		
WHERE
		LND.run_instance_skey=@RUN_INSTANCE_SKEY
  

---------UPDATE FOR MATCHED RECORDS----------

UPDATE DW
SET
	   M.[active_flag] = 'INACTIVE'
	  ,M.[m_updated_timestamp] = getdate()
FROM
	[m].[tbl_sf_participation] M
INNER JOIN
	#temp_participation LND
ON 	LND.[company] = M.[company] and
	LND.[client_last_name] = M.[client_last_name] and
	LND.[client_first_name] = M.[client_first_name] and
	LND.[cmr_program_type] = M.[cmr_program_type]
WHERE LND.to_do = 'INACTIVE'

  
------INSERT FOR UNMATCHED RECORDS----------

INSERT INTO [m].[tbl_sf_client_program_info]
(
	 [company]
	,[client_last_name]
	,[client_first_name]
	,[rel_to_employee]
	,[solucia_id]
	,[intake_id]
	,[client_dob]
	,[client_gender]
	,[home_phone]
	,[work_phone]
	,[cell_phone]
	,[email]
	,[street_address_1]
	,[street_address_2]
	,[city]
	,[state]
	,[zip_code]
	,[enrolled_diagnosis]
	,[employee_last_name]
	,[employee_first_name]
	,[referral_source]
	,[integration_partner]
	,[insurance_carrier]
	,[intake_date]
	,[cmr_program_type]
	,[program_sub_type]
	,[pre_opn]
	,[pre_phy]
	,[pre_smo]
	,[pre_mis]
	,[pre_med]
	,[pre_lif]
	,[pre_lip]
	,[pre_ivs]
	,[preintent_surgical_procedure]
	,[postintent_surgical_procedure]
	,[survey_completed]
	,[survey_not_completed]
	,[survey_result]
	,[year_of_impact]
	,[a]
	,[b]
	,[c]
	,[d]
	,[e]
	,[f]
	,[g]
	,[h]
	,[i]
	,[j]
	,[k]
	,[no_impact]
	,[impact_status_cmr]
	,[post_med]
	,[post_lif]
	,[post_lip]
	,[post_ivs]
	,[post_mis]
	,[active_flag]
	,[source_file_skey]
	,[run_instance_skey]
	,[m_inserted_timestamp]
)
SELECT
	 [company]
	,[client_last_name]
	,[client_first_name]
	,[rel_to_employee]
	,[solucia_id]
	,[intake_id]
	,[client_dob]
	,[client_gender]
	,[home_phone]
	,[work_phone]
	,[cell_phone]
	,[email]
	,[street_address_1]
	,[street_address_2]
	,[city]
	,[state]
	,[zip_code]
	,[enrolled_diagnosis]
	,[employee_last_name]
	,[employee_first_name]
	,[referral_source]
	,[integration_partner]
	,[insurance_carrier]
	,[intake_date]
	,[cmr_program_type]
	,[program_sub_type]
	,[pre_opn]
	,[pre_phy]
	,[pre_smo]
	,[pre_mis]
	,[pre_med]
	,[pre_lif]
	,[pre_lip]
	,[pre_ivs]
	,[preintent_surgical_procedure]
	,[postintent_surgical_procedure]
	,[survey_completed]
	,[survey_not_completed]
	,[survey_result]
	,[year_of_impact]
	,[a]
	,[b]
	,[c]
	,[d]
	,[e]
	,[f]
	,[g]
	,[h]
	,[i]
	,[j]
	,[k]
	,[no_impact]
	,[impact_status_cmr]
	,[post_med]
	,[post_lif]
	,[post_lip]
	,[post_ivs]
	,[post_mis]
	,'ACTIVE'
	,[source_file_skey]
	,[run_instance_skey]
  	,getdate()

FROM
		#temp_participation


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
SELECT @UPDATE_COUNT=COUNT(*) FROM #temp_participation WHERE to_do='INACTIVE'

-----------FETCHING NEW INSERT COUNT-----------

SELECT @INSERT_COUNT=COUNT(*) FROM #temp_participation


END

