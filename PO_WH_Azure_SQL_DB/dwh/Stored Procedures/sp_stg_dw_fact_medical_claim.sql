
CREATE PROCEDURE [dwh].[sp_stg_dw_fact_medical_claim]
@RUN_INSTANCE_SKEY INT , 
@UPDATE_COUNT INT OUTPUT,
@DELETE_COUNT INT OUTPUT,
@INSERT_COUNT INT OUTPUT,
@STATUS INT OUTPUT,
@SOURCE_COUNT INT OUTPUT
AS

BEGIN

BEGIN TRY

  BEGIN TRANSACTION 

		/*-------------------SPROC DESCRIPTION---------------------------

		INFO:
		--> DATA FREQUENCY IS "MONTHLY"
		-->	LOAD STRATEGY IS "DELETE + INSERT"
		-->	DELETION IS BASED ON YEAR and MONTH

		----------------------------------------------------------------*/

		/*--
		--------DECLARE VARIABLES------------- */

		DECLARE @V_FISCAL_YEAR	INT
		DECLARE @V_FISCAL_MONTH INT
		

		--------FILTERING ROW LEVEL DUPLICATES-------------

		  DROP TABLE IF EXISTS #TEMP_STG_MEDICAL_CLAIM

	      SELECT [medical_claim_skey]
				,[member_key]
				,[claim_id]
				,[claim_line_id]
				,[client_adjustment_sequence]
				,[service_from_date]
				,[service_to_date]
				,[paid_date]
				,[admission_flag]
				,[admission_date]
				,[discharge_date]
				,[admission_days]
				,[drg]
				,[icd_proc_code_1]
				,[icd_proc_code_2]
				,[icd_proc_code_3]
				,[icd_proc_code_4]
				,[icd_proc_code_5]
				,[proc_code]
				,[revenue_code]
				,[service_type]
				,[bill_type_code]
				,[network_ind]
				,[capitation]
				,[major_service_category]
				,[minor_service_category]
				,[minor_service_subcategory]
				,[allowed_amount]
				,[paid_amount]
				,[coinsurance_amount]
				,[copay_amount]
				,[deductible_amount]
				,[cob_amount]
				,[claim_type]
				,[claim_status]
				,[refering_provider_id]
				,[servicing_provider_id]
				,[servicing_provider_type]
				,[servicing_provider_speciality_code]
				,[billing_provider_id]
				,[provider_npi]
				,[group_npi]
				,[place_of_service_code]
				,[speciality_code_description]
				,[provider_address_1]
				,[provider_address_2]
				,[provider_city]
				,[provider_state]
				,[provider_zip]
				,[provider_country]
				,[admit_source_code]
				,[icd_version]
				,[diagnosis_code_1]
				,[diagnosis_code_2]
				,[diagnosis_code_3]
				,[diagnosis_code_4]
				,[diagnosis_code_5]
				,[diagnosis_code_6]
				,[diagnosis_code_7]
				,[diagnosis_code_8]
				,[diagnosis_code_9]
				,[diagnosis_code_10]
				,[diagnosis_code_11]
				,[diagnosis_code_12]
				,[diagnosis_code_13]
				,[diagnosis_code_14]
				,[diagnosis_code_15]
				,[diagnosis_code_16]
				,[diagnosis_code_17]
				,[diagnosis_code_18]
				,[diagnosis_code_19]
				,[diagnosis_code_20]
				,[diagnosis_code_21]
				,[diagnosis_code_22]
				,[diagnosis_code_23]
				,[diagnosis_code_24]
				,[diagnosis_code_25]
				,[run_instance_skey]
				,[year]
				,[month]
				,[client_name]
				,[carrier_name]
				,[source_file_skey]
				,[stg_inserted_timestamp]
  
		  
		  INTO #TEMP_STG_MEDICAL_CLAIM
		  
		  FROM [db-po-warehouse-dev-eus].[stg].[tbl_medical_claim]	TMP

		  WHERE
				TMP.run_instance_skey=@RUN_INSTANCE_SKEY

		
		
		
		--------FETCHING RECORDS FROM STAGING & PUSHING INTO TEMP TABLE--------
		
		DROP TABLE IF EXISTS #TEMP_MEDICAL_CLAIM

		SELECT 
				STG.*
			,	PROV.provider_skey
			,	MBR.member_skey
			,	'INSERT' AS TO_DO
		INTO #TEMP_MEDICAL_CLAIM
		FROM 
			#TEMP_STG_MEDICAL_CLAIM STG
		INNER JOIN
			[dwh].[dim_tbl_provider] PROV
		ON	STG.provider_npi = PROV.provider_npi
		INNER JOIN
			[dwh].[dim_tbl_member] MBR
		ON  STG.member_key = MBR.member_key                  ------ Need to Identify unique key in member table
		WHERE STG.run_instance_skey=@RUN_INSTANCE_SKEY

		SELECT @SOURCE_COUNT=@@ROWCOUNT


		/*--Change_ID 2
		-------SET YEAR KEY FOR INSER/DELETE---------------------	
			
			SET @V_FISCAL_YEAR  =(SELECT DISTINCT FISCAL_YEAR_SKEY FROM #TEMP_EBIDTA)
			SET @V_FISCAL_MONTH =(SELECT DISTINCT FISCAL_MONTH_SKEY FROM #TEMP_EBIDTA)
		*/	

		-------TAKING BACKUP OF MATCHED RECORDS BEFORE DELETION---------		

	INSERT INTO [bkp].[fact_tbl_medical_claim_history]
           ([medical_claim_skey]
           ,[member_skey]
           ,[claim_id]
           ,[claim_line_id]
           ,[client_adjustment_sequence]
           ,[service_from_date]
           ,[service_to_date]
           ,[paid_date]
           ,[admission_flag]
           ,[admission_date]
           ,[discharge_date]
           ,[admission_days]
           ,[drg]
           ,[icd_proc_code_1]
           ,[icd_proc_code_2]
           ,[icd_proc_code_3]
           ,[icd_proc_code_4]
           ,[icd_proc_code_5]
           ,[proc_code]
           ,[revenue_code]
           ,[service_type]
           ,[bill_type_code]
           ,[network_ind]
           ,[capitation]
           ,[major_service_category]
           ,[minor_service_category]
           ,[minor_service_subcategory]
           ,[allowed_amount]
           ,[paid_amount]
           ,[coinsurance_amount]
           ,[copay_amount]
           ,[deductible_amount]
           ,[cob_amount]
           ,[claim_type]
           ,[claim_status]
           ,[refering_provider_id]
           ,[servicing_provider_id]
           ,[servicing_provider_type]
           ,[servicing_provider_speciality_code]
           ,[billing_provider_id]
           ,[group_npi]
           ,[place_of_service_code]
           ,[speciality_code_description]
           ,[admit_source_code]
           ,[icd_version]
           ,[diagnosis_code_1]
           ,[diagnosis_code_2]
           ,[diagnosis_code_3]
           ,[diagnosis_code_4]
           ,[diagnosis_code_5]
           ,[diagnosis_code_6]
           ,[diagnosis_code_7]
           ,[diagnosis_code_8]
           ,[diagnosis_code_9]
           ,[diagnosis_code_10]
           ,[diagnosis_code_11]
           ,[diagnosis_code_12]
           ,[diagnosis_code_13]
           ,[diagnosis_code_14]
           ,[diagnosis_code_15]
           ,[diagnosis_code_16]
           ,[diagnosis_code_17]
           ,[diagnosis_code_18]
           ,[diagnosis_code_19]
           ,[diagnosis_code_20]
           ,[diagnosis_code_21]
           ,[diagnosis_code_22]
           ,[diagnosis_code_23]
           ,[diagnosis_code_24]
           ,[diagnosis_code_25]
           ,[provider_skey]
           ,[run_instance_skey]
           ,[source_file_skey]
           ,[year]
           ,[month]
           ,[client_name]
           ,[carrier_name])
		

		SELECT		
			 FE.[medical_claim_skey]
           ,FE.[member_skey]
           ,FE.[claim_id]
           ,FE.[claim_line_id]
           ,FE.[client_adjustment_sequence]
           ,FE.[service_from_date]
           ,FE.[service_to_date]
           ,FE.[paid_date]
           ,FE.[admission_flag]
           ,FE.[admission_date]
           ,FE.[discharge_date]
           ,FE.[admission_days]
           ,FE.[drg]
           ,FE.[icd_proc_code_1]
           ,FE.[icd_proc_code_2]
           ,FE.[icd_proc_code_3]
           ,FE.[icd_proc_code_4]
           ,FE.[icd_proc_code_5]
           ,FE.[proc_code]
           ,FE.[revenue_code]
           ,FE.[service_type]
           ,FE.[bill_type_code]
           ,FE.[network_ind]
           ,FE.[capitation]
           ,FE.[major_service_category]
           ,FE.[minor_service_category]
           ,FE.[minor_service_subcategory]
           ,FE.[allowed_amount]
           ,FE.[paid_amount]
           ,FE.[coinsurance_amount]
           ,FE.[copay_amount]
           ,FE.[deductible_amount]
           ,FE.[cob_amount]
           ,FE.[claim_type]
           ,FE.[claim_status]
           ,FE.[refering_provider_id]
           ,FE.[servicing_provider_id]
           ,FE.[servicing_provider_type]
           ,FE.[servicing_provider_speciality_code]
           ,FE.[billing_provider_id]
           ,FE.[group_npi]
           ,FE.[place_of_service_code]
           ,FE.[speciality_code_description]
           ,FE.[admit_source_code]
           ,FE.[icd_version]
           ,FE.[diagnosis_code_1]
           ,FE.[diagnosis_code_2]
           ,FE.[diagnosis_code_3]
           ,FE.[diagnosis_code_4]
           ,FE.[diagnosis_code_5]
           ,FE.[diagnosis_code_6]
           ,FE.[diagnosis_code_7]
           ,FE.[diagnosis_code_8]
           ,FE.[diagnosis_code_9]
           ,FE.[diagnosis_code_10]
           ,FE.[diagnosis_code_11]
           ,FE.[diagnosis_code_12]
           ,FE.[diagnosis_code_13]
           ,FE.[diagnosis_code_14]
           ,FE.[diagnosis_code_15]
           ,FE.[diagnosis_code_16]
           ,FE.[diagnosis_code_17]
           ,FE.[diagnosis_code_18]
           ,FE.[diagnosis_code_19]
           ,FE.[diagnosis_code_20]
           ,FE.[diagnosis_code_21]
           ,FE.[diagnosis_code_22]
           ,FE.[diagnosis_code_23]
           ,FE.[diagnosis_code_24]
           ,FE.[diagnosis_code_25]
           ,FE.[provider_skey]
           ,FE.[run_instance_skey]
           ,FE.[source_file_skey]
           ,FE.[year]
           ,FE.[month]
           ,FE.[client_name]
           ,FE.[carrier_name]			
		FROM 
			[dwh].[fact_tbl_medical_claim]	FE
		WHERE FE.year IN (SELECT DISTINCT year FROM #TEMP_MEDICAL_CLAIM)		--Change_ID 2
		AND FE.month IN (SELECT DISTINCT month FROM #TEMP_MEDICAL_CLAIM)
		AND FE.run_instance_skey NOT IN (SELECT DISTINCT run_instance_skey FROM [bkp].[fact_tbl_medical_claim_history])

		-------DELETION FOR MATCHED RECORDS---------

		DELETE FE
		FROM 
			[dwh].[fact_tbl_medical_claim]	FE
		WHERE FE.year IN (SELECT DISTINCT year FROM #TEMP_MEDICAL_CLAIM)		--Change_ID 2
		AND FE.month IN (SELECT DISTINCT month FROM #TEMP_MEDICAL_CLAIM)				--Change_ID 2
		
		SELECT @DELETE_COUNT=@@ROWCOUNT

		------INSERT FOR UNMATCHED RECORDS----------

INSERT INTO [dwh].[fact_tbl_medical_claim]
           (
            [medical_claim_skey]
           ,[member_skey]
           ,[claim_id]
           ,[claim_line_id]
           ,[client_adjustment_sequence]
           ,[service_from_date]
           ,[service_to_date]
           ,[paid_date]
           ,[admission_flag]
           ,[admission_date]
           ,[discharge_date]
           ,[admission_days]
           ,[drg]
           ,[icd_proc_code_1]
           ,[icd_proc_code_2]
           ,[icd_proc_code_3]
           ,[icd_proc_code_4]
           ,[icd_proc_code_5]
           ,[proc_code]
           ,[revenue_code]
           ,[service_type]
           ,[bill_type_code]
           ,[network_ind]
           ,[capitation]
           ,[major_service_category]
           ,[minor_service_category]
           ,[minor_service_subcategory]
           ,[allowed_amount]
           ,[paid_amount]
           ,[coinsurance_amount]
           ,[copay_amount]
           ,[deductible_amount]
           ,[cob_amount]
           ,[claim_type]
           ,[claim_status]
           ,[refering_provider_id]
           ,[servicing_provider_id]
           ,[servicing_provider_type]
           ,[servicing_provider_speciality_code]
           ,[billing_provider_id]
           ,[group_npi]
           ,[place_of_service_code]
           ,[speciality_code_description]
           ,[admit_source_code]
           ,[icd_version]
           ,[diagnosis_code_1]
           ,[diagnosis_code_2]
           ,[diagnosis_code_3]
           ,[diagnosis_code_4]
           ,[diagnosis_code_5]
           ,[diagnosis_code_6]
           ,[diagnosis_code_7]
           ,[diagnosis_code_8]
           ,[diagnosis_code_9]
           ,[diagnosis_code_10]
           ,[diagnosis_code_11]
           ,[diagnosis_code_12]
           ,[diagnosis_code_13]
           ,[diagnosis_code_14]
           ,[diagnosis_code_15]
           ,[diagnosis_code_16]
           ,[diagnosis_code_17]
           ,[diagnosis_code_18]
           ,[diagnosis_code_19]
           ,[diagnosis_code_20]
           ,[diagnosis_code_21]
           ,[diagnosis_code_22]
           ,[diagnosis_code_23]
           ,[diagnosis_code_24]
           ,[diagnosis_code_25]
           ,[provider_skey]
           ,[run_instance_skey]
           ,[source_file_skey]
           ,[year]
           ,[month]
           ,[client_name]
           ,[carrier_name])

		SELECT
			[medical_claim_skey]
           ,[member_skey]
           ,[claim_id]
           ,[claim_line_id]
           ,[client_adjustment_sequence]
           ,[service_from_date]
           ,[service_to_date]
           ,[paid_date]
           ,[admission_flag]
           ,[admission_date]
           ,[discharge_date]
           ,[admission_days]
           ,[drg]
           ,[icd_proc_code_1]
           ,[icd_proc_code_2]
           ,[icd_proc_code_3]
           ,[icd_proc_code_4]
           ,[icd_proc_code_5]
           ,[proc_code]
           ,[revenue_code]
           ,[service_type]
           ,[bill_type_code]
           ,[network_ind]
           ,[capitation]
           ,[major_service_category]
           ,[minor_service_category]
           ,[minor_service_subcategory]
           ,[allowed_amount]
           ,[paid_amount]
           ,[coinsurance_amount]
           ,[copay_amount]
           ,[deductible_amount]
           ,[cob_amount]
           ,[claim_type]
           ,[claim_status]
           ,[refering_provider_id]
           ,[servicing_provider_id]
           ,[servicing_provider_type]
           ,[servicing_provider_speciality_code]
           ,[billing_provider_id]
           ,[group_npi]
           ,[place_of_service_code]
           ,[speciality_code_description]
           ,[admit_source_code]
           ,[icd_version]
           ,[diagnosis_code_1]
           ,[diagnosis_code_2]
           ,[diagnosis_code_3]
           ,[diagnosis_code_4]
           ,[diagnosis_code_5]
           ,[diagnosis_code_6]
           ,[diagnosis_code_7]
           ,[diagnosis_code_8]
           ,[diagnosis_code_9]
           ,[diagnosis_code_10]
           ,[diagnosis_code_11]
           ,[diagnosis_code_12]
           ,[diagnosis_code_13]
           ,[diagnosis_code_14]
           ,[diagnosis_code_15]
           ,[diagnosis_code_16]
           ,[diagnosis_code_17]
           ,[diagnosis_code_18]
           ,[diagnosis_code_19]
           ,[diagnosis_code_20]
           ,[diagnosis_code_21]
           ,[diagnosis_code_22]
           ,[diagnosis_code_23]
           ,[diagnosis_code_24]
           ,[diagnosis_code_25]
           ,[provider_skey]
           ,[run_instance_skey]
           ,[source_file_skey]
           ,[year]
           ,[month]
           ,[client_name]
           ,[carrier_name]
		FROM
			#TEMP_MEDICAL_CLAIM
		WHERE 
			TO_DO='INSERT'

		SELECT @INSERT_COUNT=@@ROWCOUNT

		SET @STATUS=1 

	COMMIT TRANSACTION

END TRY



BEGIN CATCH

	ROLLBACK TRANSACTION

	SELECT @UPDATE_COUNT=0,@INSERT_COUNT=0, @DELETE_COUNT=0

	SET @STATUS=0   ---SETTING THE STATUS OF FAILURE

	DECLARE @ERROR_MSG VARCHAR(255)

	SELECT @ERROR_MSG=ERROR_MESSAGE()

	-----UPDATE IN EXECUTION LOG THE ERROR MSG WHICH IS RUNNING-----
	UPDATE 
		[db-po-warehouse-dev-eus].audit.[audit_job_process_execution_log]
	SET 
	  message=@ERROR_MSG
	WHERE 
	  LOAD_STATUS='IN_PROGRESS'

END CATCH
 
END

------------------------------------------------------------------------------
/*----

Manual Execution of proc_code

Declare @r_key int
Declare @u_count int
Declare @d_count int
Declare @i_count int
Declare @status int
Declare @s_count int
exec [dwh].[sp_stg_dw_fact_medical_claim] 1, @u_count, @d_count, @i_count, @status, @s_count
select @u_count, @d_count, @i_count, @status, @s_count

---*/


