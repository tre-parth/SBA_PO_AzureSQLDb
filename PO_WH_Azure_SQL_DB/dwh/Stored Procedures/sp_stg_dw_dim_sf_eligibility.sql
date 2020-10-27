



CREATE PROCEDURE [dwh].[sp_stg_dw_dim_sf_eligibility]
@RUN_INSTANCE_SKEY INT , 
@UPDATE_COUNT INT OUTPUT,
@INSERT_COUNT INT OUTPUT,
@STATUS INT OUTPUT
AS

BEGIN

BEGIN TRY

BEGIN TRANSACTION

DROP TABLE IF EXISTS #stg_tmp_sf_eligibility

SELECT
	 stg.[sf_eligibility_skey]
	,stg.[first_name]
	,stg.[last_name]
	,stg.[mailing_street]
	,stg.[mailing_city]
	,stg.[mailing_zip_postal_code]
	,stg.[mailing_state_province]
	,stg.[mailing_country]
	,stg.[primary_phone]
	,stg.[mobile_phone]
	,stg.[fax]
	,stg.[primary_email]
	,stg.[account_name]
	,stg.[eligibility_name]
	,stg.[contact_record_type]
	,stg.[contact_id]
	,stg.[home_phone]
	,stg.[work_phone]
	,stg.[do_not_email]
	,stg.[do_not_call]
	,stg.[birth_date]
	,stg.[contact_type]
	,stg.[date_of_registration]
	,stg.[ee_unique_id]
	,stg.[eligibility]
	,stg.[ee_ssn]
	,stg.[employee_id]
	,stg.[employer_id]
	,stg.[employer]
	,stg.[gender]
	,stg.[home_email]
	,stg.[individual_type]
	,stg.[insurance_id]
	,stg.[insurance_carrier]
	,stg.[insurance_plan]
	,stg.[insurance_program]
	,stg.[method_of_registration]
	,stg.[middle_name]
	,stg.[mobile_opt_out]
	,stg.[referral_source]
	,stg.[relationship]
	,stg.[time_zone]
	,stg.[eligibility_custom_field_10_name]
	,stg.[eligibility_custom_field_10]
	,stg.[eligibility_custom_field_1_name]
	,stg.[eligibility_custom_field_1]
	,stg.[eligibility_custom_field_2_name]
	,stg.[eligibility_custom_field_2]
	,stg.[eligibility_custom_field_3_name]
	,stg.[eligibility_custom_field_3]
	,stg.[eligibility_custom_field_4_name]
	,stg.[eligibility_custom_field_4]
	,stg.[eligibility_custom_field_5_name]
	,stg.[eligibility_custom_field_5]
	,stg.[eligibility_custom_field_6_name]
	,stg.[eligibility_custom_field_6]
	,stg.[eligibility_custom_field_7_name]
	,stg.[eligibility_custom_field_7]
	,stg.[eligibility_custom_field_8_name]
	,stg.[eligibility_custom_field_8]
	,stg.[eligibility_custom_field_9_name]
	,stg.[eligibility_custom_field_9]
	,stg.[eligibility_relationship_type]
	,stg.[source_file_skey]
	,stg.[run_instance_skey]

INTO #stg_tmp_sf_eligibility

FROM
		[stg].[tbl_sf_eligibility]	 STG 
WHERE
		STG.[run_instance_skey]=@RUN_INSTANCE_SKEY


DROP TABLE IF EXISTS #temp_sf_eligibility

--------FINDING MATCHED/UNMATCHED RECORDS AND PUSHING INTO TEMP TABLE--------

SELECT
	 stg.[sf_eligibility_skey]
	,stg.[first_name]
	,stg.[last_name]
	,stg.[mailing_street]
	,stg.[mailing_city]
	,stg.[mailing_zip_postal_code]
	,stg.[mailing_state_province]
	,stg.[mailing_country]
	,stg.[primary_phone]
	,stg.[mobile_phone]
	,stg.[fax]
	,stg.[primary_email]
	,stg.[account_name]
	,stg.[eligibility_name]
	,stg.[contact_record_type]
	,stg.[contact_id]
	,stg.[home_phone]
	,stg.[work_phone]
	,stg.[do_not_email]
	,stg.[do_not_call]
	,stg.[birth_date]
	,stg.[contact_type]
	,stg.[date_of_registration]
	,stg.[ee_unique_id]
	,stg.[eligibility]
	,stg.[ee_ssn]
	,stg.[employee_id]
	,stg.[employer_id]
	,stg.[employer]
	,stg.[gender]
	,stg.[home_email]
	,stg.[individual_type]
	,stg.[insurance_id]
	,stg.[insurance_carrier]
	,stg.[insurance_plan]
	,stg.[insurance_program]
	,stg.[method_of_registration]
	,stg.[middle_name]
	,stg.[mobile_opt_out]
	,stg.[referral_source]
	,stg.[relationship]
	,stg.[time_zone]
	,stg.[eligibility_custom_field_10_name]
	,stg.[eligibility_custom_field_10]
	,stg.[eligibility_custom_field_1_name]
	,stg.[eligibility_custom_field_1]
	,stg.[eligibility_custom_field_2_name]
	,stg.[eligibility_custom_field_2]
	,stg.[eligibility_custom_field_3_name]
	,stg.[eligibility_custom_field_3]
	,stg.[eligibility_custom_field_4_name]
	,stg.[eligibility_custom_field_4]
	,stg.[eligibility_custom_field_5_name]
	,stg.[eligibility_custom_field_5]
	,stg.[eligibility_custom_field_6_name]
	,stg.[eligibility_custom_field_6]
	,stg.[eligibility_custom_field_7_name]
	,stg.[eligibility_custom_field_7]
	,stg.[eligibility_custom_field_8_name]
	,stg.[eligibility_custom_field_8]
	,stg.[eligibility_custom_field_9_name]
	,stg.[eligibility_custom_field_9]
	,stg.[eligibility_relationship_type]
	,stg.[source_file_skey]
	,stg.[run_instance_skey]
    ,IIF(DW.contact_id IS NULL,'INSERT','UPDATE') AS to_do    --IF MATCH FOUND UPDATE ELSE INSERT

INTO #temp_sf_eligibility

FROM
		#stg_tmp_sf_eligibility	 STG 
LEFT JOIN 
		[dwh].[dim_tbl_sf_eligibility] DW
ON 
		STG.contact_id = DW.contact_id
WHERE
		STG.run_instance_skey=@RUN_INSTANCE_SKEY
  

---------UPDATE FOR MATCHED RECORDS----------

UPDATE DW
SET
	   DW.[sf_eligibility_skey] = STG.[sf_eligibility_skey]
	  ,DW.[first_name] = STG.[first_name]
	  ,DW.[last_name] = STG.[last_name]
	  ,DW.[mailing_street] = STG.[mailing_street]
	  ,DW.[mailing_city] = STG.[mailing_city]
	  ,DW.[mailing_zip_postal_code] = STG.[mailing_zip_postal_code]
	  ,DW.[mailing_state_province] = STG.[mailing_state_province]
	  ,DW.[mailing_country] = STG.[mailing_country]
	  ,DW.[primary_phone] = STG.[primary_phone]
	  ,DW.[mobile_phone] = STG.[mobile_phone]
	  ,DW.[fax] = STG.[fax]
	  ,DW.[primary_email] = STG.[primary_email]
	  ,DW.[account_name] = STG.[account_name]
	  ,DW.[eligibility_name] = STG.[eligibility_name]
	  ,DW.[contact_record_type] = STG.[contact_record_type]
	  ,DW.[home_phone] = STG.[home_phone]
	  ,DW.[work_phone] = STG.[work_phone]
	  ,DW.[do_not_email] = STG.[do_not_email]
	  ,DW.[do_not_call] = STG.[do_not_call]
	  ,DW.[birth_date] = STG.[birth_date]
	  ,DW.[contact_type] = STG.[contact_type]
	  ,DW.[date_of_registration] = STG.[date_of_registration]
	  ,DW.[ee_unique_id] = STG.[ee_unique_id]
	  ,DW.[eligibility] = STG.[eligibility]
	  ,DW.[ee_ssn] = STG.[ee_ssn]
	  ,DW.[employee_id] = STG.[employee_id]
	  ,DW.[employer_id] = STG.[employer_id]
	  ,DW.[employer] = STG.[employer]
	  ,DW.[gender] = STG.[gender]
	  ,DW.[home_email] = STG.[home_email]
	  ,DW.[individual_type] = STG.[individual_type]
	  ,DW.[insurance_id] = STG.[insurance_id]
	  ,DW.[insurance_carrier] = STG.[insurance_carrier]
	  ,DW.[insurance_plan] = STG.[insurance_plan]
	  ,DW.[insurance_program] = STG.[insurance_program]
	  ,DW.[method_of_registration] = STG.[method_of_registration]
	  ,DW.[middle_name] = STG.[middle_name]
	  ,DW.[mobile_opt_out] = STG.[mobile_opt_out]
	  ,DW.[referral_source] = STG.[referral_source]
	  ,DW.[relationship] = STG.[relationship]
	  ,DW.[time_zone] = STG.[time_zone]
	  ,DW.[eligibility_custom_field_10_name] = STG.[eligibility_custom_field_10_name]
	  ,DW.[eligibility_custom_field_10] = STG.[eligibility_custom_field_10]
	  ,DW.[eligibility_custom_field_1_name] = STG.[eligibility_custom_field_1_name]
	  ,DW.[eligibility_custom_field_1] = STG.[eligibility_custom_field_1]
	  ,DW.[eligibility_custom_field_2_name] = STG.[eligibility_custom_field_2_name]
	  ,DW.[eligibility_custom_field_2] = STG.[eligibility_custom_field_2]
	  ,DW.[eligibility_custom_field_3_name] = STG.[eligibility_custom_field_3_name]
	  ,DW.[eligibility_custom_field_3] = STG.[eligibility_custom_field_3]
	  ,DW.[eligibility_custom_field_4_name] = STG.[eligibility_custom_field_4_name]
	  ,DW.[eligibility_custom_field_4] = STG.[eligibility_custom_field_4]
	  ,DW.[eligibility_custom_field_5_name] = STG.[eligibility_custom_field_5_name]
	  ,DW.[eligibility_custom_field_5] = STG.[eligibility_custom_field_5]
	  ,DW.[eligibility_custom_field_6_name] = STG.[eligibility_custom_field_6_name]
	  ,DW.[eligibility_custom_field_6] = STG.[eligibility_custom_field_6]
	  ,DW.[eligibility_custom_field_7_name] = STG.[eligibility_custom_field_7_name]
	  ,DW.[eligibility_custom_field_7] = STG.[eligibility_custom_field_7]
	  ,DW.[eligibility_custom_field_8_name] = STG.[eligibility_custom_field_8_name]
	  ,DW.[eligibility_custom_field_8] = STG.[eligibility_custom_field_8]
	  ,DW.[eligibility_custom_field_9_name] = STG.[eligibility_custom_field_9_name]
	  ,DW.[eligibility_custom_field_9] = STG.[eligibility_custom_field_9]
	  ,DW.[eligibility_relationship_type] = STG.[eligibility_relationship_type]
	  ,DW.[source_file_skey] = STG.[source_file_skey]
	  ,DW.[run_instance_skey] = STG.[run_instance_skey]
	  ,DW.[dwh_updated_timestamp] = getdate()
FROM
	[dwh].[dim_tbl_sf_eligibility] DW
INNER JOIN
	#temp_sf_eligibility STG
ON DW.contact_id = STG.contact_id
WHERE STG.to_do = 'UPDATE'

  
------INSERT FOR UNMATCHED RECORDS----------

INSERT INTO [dwh].[dim_tbl_member]
(
		 [sf_eligibility_skey]
		,[first_name]
		,[last_name]
		,[mailing_street]
		,[mailing_city]
		,[mailing_zip_postal_code]
		,[mailing_state_province]
		,[mailing_country]
		,[primary_phone]
		,[mobile_phone]
		,[fax]
		,[primary_email]
		,[account_name]
		,[eligibility_name]
		,[contact_record_type]
		,[contact_id]
		,[home_phone]
		,[work_phone]
		,[do_not_email]
		,[do_not_call]
		,[birth_date]
		,[contact_type]
		,[date_of_registration]
		,[ee_unique_id]
		,[eligibility]
		,[ee_ssn]
		,[employee_id]
		,[employer_id]
		,[employer]
		,[gender]
		,[home_email]
		,[individual_type]
		,[insurance_id]
		,[insurance_carrier]
		,[insurance_plan]
		,[insurance_program]
		,[method_of_registration]
		,[middle_name]
		,[mobile_opt_out]
		,[referral_source]
		,[relationship]
		,[time_zone]
		,[eligibility_custom_field_10_name]
		,[eligibility_custom_field_10]
		,[eligibility_custom_field_1_name]
		,[eligibility_custom_field_1]
		,[eligibility_custom_field_2_name]
		,[eligibility_custom_field_2]
		,[eligibility_custom_field_3_name]
		,[eligibility_custom_field_3]
		,[eligibility_custom_field_4_name]
		,[eligibility_custom_field_4]
		,[eligibility_custom_field_5_name]
		,[eligibility_custom_field_5]
		,[eligibility_custom_field_6_name]
		,[eligibility_custom_field_6]
		,[eligibility_custom_field_7_name]
		,[eligibility_custom_field_7]
		,[eligibility_custom_field_8_name]
		,[eligibility_custom_field_8]
		,[eligibility_custom_field_9_name]
		,[eligibility_custom_field_9]
		,[eligibility_relationship_type]
		,[source_file_skey]
		,[run_instance_skey]
		,[dwh_inserted_timestamp]
)
SELECT
		 [sf_eligibility_skey]
		,[first_name]
		,[last_name]
		,[mailing_street]
		,[mailing_city]
		,[mailing_zip_postal_code]
		,[mailing_state_province]
		,[mailing_country]
		,[primary_phone]
		,[mobile_phone]
		,[fax]
		,[primary_email]
		,[account_name]
		,[eligibility_name]
		,[contact_record_type]
		,[contact_id]
		,[home_phone]
		,[work_phone]
		,[do_not_email]
		,[do_not_call]
		,[birth_date]
		,[contact_type]
		,[date_of_registration]
		,[ee_unique_id]
		,[eligibility]
		,[ee_ssn]
		,[employee_id]
		,[employer_id]
		,[employer]
		,[gender]
		,[home_email]
		,[individual_type]
		,[insurance_id]
		,[insurance_carrier]
		,[insurance_plan]
		,[insurance_program]
		,[method_of_registration]
		,[middle_name]
		,[mobile_opt_out]
		,[referral_source]
		,[relationship]
		,[time_zone]
		,[eligibility_custom_field_10_name]
		,[eligibility_custom_field_10]
		,[eligibility_custom_field_1_name]
		,[eligibility_custom_field_1]
		,[eligibility_custom_field_2_name]
		,[eligibility_custom_field_2]
		,[eligibility_custom_field_3_name]
		,[eligibility_custom_field_3]
		,[eligibility_custom_field_4_name]
		,[eligibility_custom_field_4]
		,[eligibility_custom_field_5_name]
		,[eligibility_custom_field_5]
		,[eligibility_custom_field_6_name]
		,[eligibility_custom_field_6]
		,[eligibility_custom_field_7_name]
		,[eligibility_custom_field_7]
		,[eligibility_custom_field_8_name]
		,[eligibility_custom_field_8]
		,[eligibility_custom_field_9_name]
		,[eligibility_custom_field_9]
		,[eligibility_relationship_type]
		,[source_file_skey]
		,[run_instance_skey]
  	    ,getdate()

FROM
		#temp_sf_eligibility
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
SELECT @UPDATE_COUNT=COUNT(*) FROM #temp_sf_eligibility WHERE to_do='UPDATE'

-----------FETCHING NEW INSERT COUNT-----------

SELECT @INSERT_COUNT=COUNT(*) FROM #temp_sf_eligibility WHERE to_do='INSERT'


END

