


CREATE  PROCEDURE [audit].[USP_MEDICAL_CLAIMS_CONTROL_TOTALS_VALIDATION] 

--------DECLARE PARAMETERS WHICH ARE PASSED FROM/TO ADF PIPELINES-------------
	   @Status								int OUTPUT,
	   @Comment								varchar(100) OUTPUT,
       @Expected_Account					int,
       @Expected_Paid_Period_Start_Date		varchar(20),
       @Expected_Paid_Period_End_Date		varchar(20),
	   @Expected_Record_Count				int,
	   @Expected_Total_Deductible_Amount	decimal(18,2),
	   @Expected_Total_Coinsurance_Amount	decimal(18,2),
	   @Expected_Total_Copay_Amount			decimal(18,2),
	   @Expected_Total_Paid_Amount			decimal(18,2)
                                                                     
AS
BEGIN

       ---DECLARE VARIABLES---
	   DECLARE @V_Status								int;
	   DECLARE @V_Comment								varchar(100);
	   DECLARE @V_Expected_Account						int;
       DECLARE @V_Expected_Paid_Period_Start_Date       date;
       DECLARE @V_Expected_Paid_Period_End_Date			date;
       DECLARE @V_Expected_Record_Count                 int;
       DECLARE @V_Expected_Total_Deductible_Amount		decimal(18,2);
	   DECLARE @V_Expected_Total_Coinsurance_Amount		decimal(18,2);
	   DECLARE @V_Expected_Total_Copay_Amount  			decimal(18,2);
	   DECLARE @V_Expected_Total_Paid_Amount			decimal(18,2);
	   DECLARE @V_Actual_Distinct_Account				int;
	   DECLARE @V_Actual_Account						int;
	   DECLARE @V_Actual_Paid_Period_Start_Date			date;
	   DECLARE @V_Actual_Paid_Period_End_Date			date;
	   DECLARE @V_Actual_Record_Count					int;
	   DECLARE @V_Actual_Total_Deductible_Amount		decimal(18,2);
	   DECLARE @V_Actual_Total_Coinsurance_Amount		decimal(18,2);
	   DECLARE @V_Actual_Total_Copay_Amount  			decimal(18,2);
	   DECLARE @V_Actual_Total_Paid_Amount				decimal(18,2)



       --------ASSIGN PARAMETERS TO VARIABLES-------------

       SET  @V_Expected_Account					           =	@Expected_Account					                    
       SET  @V_Expected_Paid_Period_Start_Date             =    (SELECT CAST(@Expected_Paid_Period_Start_Date as date))		                                                                               
	   SET  @V_Expected_Paid_Period_End_Date		       =    (SELECT CAST(@Expected_Paid_Period_End_Date as date))		                                                              
	   SET  @V_Expected_Record_Count                       =  	@Expected_Record_Count				
	   SET  @V_Expected_Total_Deductible_Amount	           =  	@Expected_Total_Deductible_Amount	
	   SET	@V_Expected_Total_Coinsurance_Amount		   = 	@Expected_Total_Coinsurance_Amount	
	   SET	@V_Expected_Total_Copay_Amount  			   = 	@Expected_Total_Copay_Amount			
	   SET	@V_Expected_Total_Paid_Amount				   = 	@Expected_Total_Paid_Amount	
	   


	   ------- VALIDATE ACCOUNT -------------

	   SET @V_Actual_Distinct_Account = (SELECT COUNT(DISTINCT(Account_Number)) FROM land.tbl_medical_claim_1)
	   SET @V_Actual_Account = (SELECT DISTINCT([Account_Number]) FROM [land].[tbl_medical_claim_1])

	   BEGIN TRY
	   IF (@V_Actual_Distinct_Account = 1)
		BEGIN
			IF(@V_Actual_Account = @V_Expected_Account)
				SET @V_STATUS = 1
			ELSE
				BEGIN
				SET @V_Status = 0
				SET @V_Comment = 'Mismatch in Account Number'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
				RETURN
				END
		END
		ELSE
			BEGIN
			SET @V_Status = 0
			SET @V_Comment = 'More than a single Account in the Medical Claim File'
			SET @Status =  @V_Status;
			SET @Comment = @V_Comment;
			RETURN
			END
		END TRY
		BEGIN CATCH
			DECLARE @Message varchar(MAX) = ERROR_MESSAGE(),
					@Severity int = ERROR_SEVERITY(),
					@State smallint = ERROR_STATE()
 
					RAISERROR (@Message, @Severity, @State)
		END CATCH

	   ----------VALIDATE PAID PERIOD-------------------

	   SET @V_Actual_Paid_Period_Start_Date = (SELECT MIN(Paid_Date) FROM land.tbl_medical_claim_1)
	   SET @V_Actual_Paid_Period_End_Date	= (SELECT MAX(Paid_Date) FROM land.tbl_medical_claim_1)

	   BEGIN TRY
	   IF (@V_Actual_Paid_Period_Start_Date >= @V_Expected_Paid_Period_Start_Date)
		BEGIN
			IF(@V_Actual_Paid_Period_End_Date <= @V_Expected_Paid_Period_End_Date)
				SET @V_STATUS = 1
			ELSE
				BEGIN
				SET @V_Status = 0
				SET @V_Comment = 'Paid Date exceeds the range for Paid Period'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
				RETURN
				END
		END
		ELSE
			BEGIN
			SET @V_Status = 0
			SET @V_Comment = 'Paid Date does not lie in Paid Period '
			SET @Status =  @V_Status;
			SET @Comment = @V_Comment;
			RETURN
			END
		END TRY
		BEGIN CATCH
			DECLARE @Message_paid_period varchar(MAX) = ERROR_MESSAGE(),
					@Severity_paid_period int = ERROR_SEVERITY(),
					@State_paid_period smallint = ERROR_STATE()
 
					RAISERROR (@Message_paid_period, @Severity_paid_period, @State_paid_period)
		END CATCH

	   -------------VALIDATE RECORD COUNT------------------------

	   SET @V_Actual_Record_Count = (SELECT COUNT(*) FROM land.tbl_medical_claim_1)

	   BEGIN TRY
	   IF (@V_Actual_Record_Count = @V_Expected_Record_Count)
				SET @V_STATUS = 1
			ELSE
				BEGIN
				SET @V_Status = 0
				SET @V_Comment = 'Mismatch in Record Count'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
				RETURN
				END
		END TRY
		BEGIN CATCH
			DECLARE @Message_record_count varchar(MAX) = ERROR_MESSAGE(),
					@Severity_record_count int = ERROR_SEVERITY(),
					@State_record_count smallint = ERROR_STATE()
 
					RAISERROR (@Message_record_count, @Severity_record_count, @State_record_count)
		END CATCH

	   ------------VALIDATE TOTAL DEDUCTIBLE AMOUNT---------------

	   SET @V_Actual_Total_Deductible_Amount	= (SELECT SUM(Deductible_Amount) FROM land.tbl_medical_claim_1 GROUP BY Account_Number)

	   BEGIN TRY
	   IF (@V_Actual_Total_Deductible_Amount = @V_Expected_Total_Deductible_Amount)
				SET @V_STATUS = 1
			ELSE
				BEGIN
				SET @V_Status = 0
				SET @V_Comment = 'Mismatch in Total Deductible Amount'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
				RETURN
				END
		END TRY
		BEGIN CATCH
			DECLARE @Message_deductible_amount varchar(MAX) = ERROR_MESSAGE(),
					@Severity_deductible_amount int = ERROR_SEVERITY(),
					@State_deductible_amount smallint = ERROR_STATE()
 
					RAISERROR (@Message_deductible_amount, @Severity_deductible_amount, @State_deductible_amount)
		END CATCH

	   	------------VALIDATE TOTAL CONINSURANCE AMOUNT---------------

	   SET @V_Actual_Total_Coinsurance_Amount	= (SELECT SUM(Coinsurance_Amount) FROM land.tbl_medical_claim_1 GROUP BY Account_Number)

	   BEGIN TRY
	   IF (@V_Actual_Total_Coinsurance_Amount = @V_Expected_Total_Coinsurance_Amount)
				SET @V_STATUS = 1
			ELSE
				BEGIN
				SET @V_Status = 0
				SET @V_Comment = 'Mismatch in Total Coinsurance Amount'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
				RETURN
				END
		END TRY
		BEGIN CATCH
			DECLARE @Message_coninsurance_amount varchar(MAX) = ERROR_MESSAGE(),
					@Severity_coninsurance_amount int = ERROR_SEVERITY(),
					@State_coninsurance_amount smallint = ERROR_STATE()
 
					RAISERROR (@Message_coninsurance_amount, @Severity_coninsurance_amount, @State_coninsurance_amount)
		END CATCH

	   ------------VALIDATE TOTAL COPAY AMOUNT---------------
	   
	   SET @V_Actual_Total_Copay_Amount			= (SELECT SUM(Copay_Amount) FROM land.tbl_medical_claim_1 GROUP BY Account_Number)

	   BEGIN TRY
	   IF (@V_Actual_Total_Copay_Amount = @V_Expected_Total_Copay_Amount)
				SET @V_STATUS = 1
			ELSE
				BEGIN
				SET @V_Status = 0
				SET @V_Comment = 'Mismatch in Total Copay Amount'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
				RETURN
				END
		END TRY
		BEGIN CATCH
			DECLARE @Message_copay_amount varchar(MAX) = ERROR_MESSAGE(),
					@Severity_copay_amount int = ERROR_SEVERITY(),
					@State_copay_amount smallint = ERROR_STATE()
 
					RAISERROR (@Message_copay_amount, @Severity_copay_amount, @State_copay_amount)
		END CATCH

	   ------------VALIDATE TOTAL PAID AMOUNT---------------
	   
	   SET @V_Actual_Total_Paid_Amount			= (SELECT SUM(Paid_Amount) FROM land.tbl_medical_claim_1 GROUP BY Account_Number)

	   BEGIN TRY
	   IF (@V_Actual_Total_Paid_Amount = @V_Expected_Total_Paid_Amount)
			BEGIN
				SET @V_STATUS = 1
				SET @V_Comment = 'Control Totals Validated Successfully'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
			END
			ELSE
				BEGIN
				SET @V_Status = 0
				SET @V_Comment = 'Mismatch in Total Paid Amount'
				SET @Status =  @V_Status;
				SET @Comment = @V_Comment;
				RETURN
				END
		END TRY
		BEGIN CATCH
			DECLARE @Message_paid_amount varchar(MAX) = ERROR_MESSAGE(),
					@Severity_paid_amount int = ERROR_SEVERITY(),
					@State_paid_amount smallint = ERROR_STATE()
 
					RAISERROR (@Message_paid_amount, @Severity_paid_amount, @State_paid_amount)
		END CATCH

SELECT @Status,@Comment
	  
END
 
