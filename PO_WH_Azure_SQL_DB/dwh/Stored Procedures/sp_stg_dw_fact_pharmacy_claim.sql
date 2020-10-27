

CREATE PROCEDURE [dwh].[sp_stg_dw_fact_pharmacy_claim]
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
		--> DATA FREQUENCY IS MONTHLY
		-->	LOAD STRATEGY IS DELETE + INSERT
		-->	DELETION IS BASED ON YEAR and MONTH

		----------------------------------------------------------------*/

		/*--
		--------DECLARE VARIABLES------------- */

		DECLARE @V_FISCAL_YEAR	INT
		DECLARE @V_FISCAL_MONTH INT
		

		--------FILTERING ROW LEVEL DUPLICATES-------------

		  DROP TABLE IF EXISTS #temp_stg_pharmacy_claim

	      SELECT    [pharmacy_claim_skey]
				   ,[member_id]
				   ,[claim_id]
				   ,[ndc]
				   ,[fill_date]
				   ,[paid_date]
				   ,[days_supply]
				   ,[quantity_dispensed]
				   ,[refill_indicator]
				   ,[drug_unit_of_measure]
				   ,[generic_drug_indicator]
				   ,[in_Out_network_indicator]
				   ,[mail_order_indicator]
				   ,[paid_amount]
				   ,[allowed_amount]
				   ,[coinsurance]
				   ,[copay]
				   ,[prescribing_provider_id]
				   ,[claim_status]
				   ,[compound_code]
				   ,[dispensed_as_written]
				   ,[drug_product_name]
				   ,[drug_strength_measurement]
				   ,[formulary_indicator]
				   ,[maintenance_indicator]
				   ,[pharmacy_identifier]
				   ,[year]
				   ,[month]
				   ,[client_name]
				   ,[carrier_name]
				   ,[run_instance_skey]
				   ,[source_file_skey]
		  
		  INTO #temp_stg_pharmacy_claim
		  
		  FROM [db-po-warehouse-dev-eus].[stg].[tbl_pharmacy_claim]	TMP

		  WHERE
				TMP.run_instance_skey=@RUN_INSTANCE_SKEY

		
		
		
		--------FETCHING RECORDS FROM STAGING & PUSHING INTO TEMP TABLE--------
		
		DROP TABLE IF EXISTS #temp_pharmacy_claim

		SELECT 
				STG.*
			,	PROV.provider_skey
			,	MBR.member_skey
			,	'INSERT' AS to_do
		INTO #temp_pharmacy_claim
		FROM 
			#temp_stg_pharmacy_claim STG
		INNER JOIN
			[dwh].[dim_tbl_provider] PROV
		ON	STG.prescribing_provider_id = PROV.provider_npi
		INNER JOIN
			[dwh].[dim_tbl_member] MBR
		ON  STG.member_id = MBR.member_key                  ------ Need to Identify unique key in member table
		WHERE STG.run_instance_skey=@RUN_INSTANCE_SKEY

		SELECT @SOURCE_COUNT=@@ROWCOUNT


		/*--Change_ID 2
		-------SET YEAR KEY FOR INSER/DELETE---------------------	
			
			SET @V_FISCAL_YEAR  =(SELECT DISTINCT FISCAL_YEAR_SKEY FROM #TEMP_EBIDTA)
			SET @V_FISCAL_MONTH =(SELECT DISTINCT FISCAL_MONTH_SKEY FROM #TEMP_EBIDTA)
		*/	

		-------TAKING BACKUP OF MATCHED RECORDS BEFORE DELETION---------		

	INSERT INTO [bkp].[fact_tbl_pharmacy_claim_history]
           ([pharmacy_claim_skey]
		   ,[member_skey]
		   ,[claim_id]
		   ,[ndc]
		   ,[fill_date]
		   ,[paid_date]
		   ,[days_supply]
		   ,[quantity_dispensed]
		   ,[refill_indicator]
		   ,[drug_unit_of_measure]
		   ,[generic_drug_indicator]
		   ,[in_Out_network_indicator]
		   ,[mail_order_indicator]
		   ,[paid_amount]
		   ,[allowed_amount]
		   ,[coinsurance]
		   ,[copay]
		   ,[provider_skey]
		   ,[claim_status]
		   ,[compound_code]
		   ,[dispensed_as_written]
		   ,[drug_product_name]
		   ,[drug_strength_measurement]
		   ,[formulary_indicator]
		   ,[maintenance_indicator]
		   ,[pharmacy_identifier]
		   ,[prescription_fill_number]
		   ,[prescription_number]
		   ,[prescription_written_date]
		   ,[year]
		   ,[month]
		   ,[client_name]
		   ,[carrier_name]
		   ,[run_instance_skey]
		   ,[source_file_skey]
		   ,[dw_inserted_timestamp])
		

		SELECT		
			FE.[pharmacy_claim_skey]
		   ,FE.[member_skey]
		   ,FE.[claim_id]
		   ,FE.[ndc]
		   ,FE.[fill_date]
		   ,FE.[paid_date]
		   ,FE.[days_supply]
		   ,FE.[quantity_dispensed]
		   ,FE.[refill_indicator]
		   ,FE.[drug_unit_of_measure]
		   ,FE.[generic_drug_indicator]
		   ,FE.[in_Out_network_indicator]
		   ,FE.[mail_order_indicator]
		   ,FE.[paid_amount]
		   ,FE.[allowed_amount]
		   ,FE.[coinsurance]
		   ,FE.[copay]
		   ,FE.[provider_skey]
		   ,FE.[claim_status]
		   ,FE.[compound_code]
		   ,FE.[dispensed_as_written]
		   ,FE.[drug_product_name]
		   ,FE.[drug_strength_measurement]
		   ,FE.[formulary_indicator]
		   ,FE.[maintenance_indicator]
		   ,FE.[pharmacy_identifier]
		   ,FE.[prescription_fill_number]
		   ,FE.[prescription_number]
		   ,FE.[prescription_written_date]
		   ,FE.[year]
		   ,FE.[month]
		   ,FE.[client_name]
		   ,FE.[carrier_name]
		   ,FE.[run_instance_skey]
		   ,FE.[source_file_skey]
		   ,getdate()			
		FROM 
			[dwh].[fact_tbl_pharmacy_claim]	FE
		WHERE CONCAT(FE.year,FE.month) IN (SELECT DISTINCT CONCAT(year,month) FROM #TEMP_MEDICAL_CLAIM)
		AND FE.run_instance_skey NOT IN (SELECT DISTINCT run_instance_skey FROM [bkp].[fact_tbl_pharmacy_claim_history])

		-------DELETION FOR MATCHED RECORDS---------

		DELETE FE
		FROM 
			[dwh].[fact_tbl_pharmacy_claim]	FE
		WHERE CONCAT(FE.year,FE.month) IN (SELECT DISTINCT CONCAT(year,month) FROM #TEMP_MEDICAL_CLAIM)
		
		SELECT @DELETE_COUNT=@@ROWCOUNT

		------INSERT FOR UNMATCHED RECORDS----------

INSERT INTO [dwh].[fact_tbl_pharmacy_claim]
           (
            [pharmacy_claim_skey]
		   ,[member_skey]
		   ,[claim_id]
		   ,[ndc]
		   ,[fill_date]
		   ,[paid_date]
		   ,[days_supply]
		   ,[quantity_dispensed]
		   ,[refill_indicator]
		   ,[drug_unit_of_measure]
		   ,[generic_drug_indicator]
		   ,[in_Out_network_indicator]
		   ,[mail_order_indicator]
		   ,[paid_amount]
		   ,[allowed_amount]
		   ,[coinsurance]
		   ,[copay]
		   ,[provider_skey]
		   ,[claim_status]
		   ,[compound_code]
		   ,[dispensed_as_written]
		   ,[drug_product_name]
		   ,[drug_strength_measurement]
		   ,[formulary_indicator]
		   ,[maintenance_indicator]
		   ,[pharmacy_identifier]
		   ,[prescription_fill_number]
		   ,[prescription_number]
		   ,[prescription_written_date]
		   ,[year]
		   ,[month]
		   ,[client_name]
		   ,[carrier_name]
		   ,[run_instance_skey]
		   ,[source_file_skey]
		   ,[dw_inserted_timestamp])

		SELECT
			[pharmacy_claim_skey]
		   ,[member_skey]
		   ,[claim_id]
		   ,[ndc]
		   ,[fill_date]
		   ,[paid_date]
		   ,[days_supply]
		   ,[quantity_dispensed]
		   ,[refill_indicator]
		   ,[drug_unit_of_measure]
		   ,[generic_drug_indicator]
		   ,[in_Out_network_indicator]
		   ,[mail_order_indicator]
		   ,[paid_amount]
		   ,[allowed_amount]
		   ,[coinsurance]
		   ,[copay]
		   ,[provider_skey]
		   ,[claim_status]
		   ,[compound_code]
		   ,[dispensed_as_written]
		   ,[drug_product_name]
		   ,[drug_strength_measurement]
		   ,[formulary_indicator]
		   ,[maintenance_indicator]
		   ,[pharmacy_identifier]
		   ,[prescription_fill_number]
		   ,[prescription_number]
		   ,[prescription_written_date]
		   ,[year]
		   ,[month]
		   ,[client_name]
		   ,[carrier_name]
		   ,[run_instance_skey]
		   ,[source_file_skey]
		   ,getdate()
		FROM
			#temp_pharmacy_claim
		WHERE 
			to_do='INSERT'

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
exec [dwh].[sp_stg_dw_fact_pharmacy_claim] 1, @u_count, @d_count, @i_count, @status, @s_count
select @u_count, @d_count, @i_count, @status, @s_count

---*/


