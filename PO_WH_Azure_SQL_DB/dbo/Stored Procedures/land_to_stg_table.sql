
CREATE PROCEDURE  [dbo].[land_to_stg_table]
@Carrier varchar(100),
@Client varchar(100),
@year int,
@month int,
@run_instance_skey int,
@source_file_skey int
AS
BEGIN
	
INSERT into [stg].[tbl_medical_claim](
[Account_Number]
      ,[Carrier_Member_ID]
      ,[Claim_ID]
      ,[Claim_Line_ID]
      ,[Service_From_date]
      ,[Servce_To_date]
      ,[admission_date]
      ,[discharge_date]
      ,[Admission_ID]
      ,[Type_of_Admission]
      ,[Admitting_Diagnosis_Code]
      ,[Admit_source_code]
      ,[Discharge_Status_Code]
      ,[Place of Service Code]
      ,[service Type]
      ,[Line_Of_Business]
      ,[PROC_CODE]
      ,[PROC_CODE_2]
      ,[PROC_CODE_TYPE]
      ,[PROC_CODE_2_TYPE]
      ,[Procedure_Code_Modifier]
      ,[ICD_Proc_code_1]
      ,[ICD_Proc_code_2]
      ,[ICD_Proc_code_3]
      ,[ICD_Proc_code_4]
      ,[ICD_Proc_code_5]
      ,[Paid_date]
      ,[Paid_amount]
      ,[Allowed_amount]
      ,[Deductible]
      ,[Coinsurance_amount]
      ,[Copay_amount]
      ,[COB_amount]
      ,[Claim_type]
      ,[Bill Type Code]
      ,[Revenue_code]
      ,[DRG]
      ,[MS_DRG]
      ,[Claim_status]
      ,[Units]
      ,[Diagnosis_code_1]
      ,[Diagnosis_code_2]
      ,[Diagnosis_code_3]
      ,[Diagnosis_code_4]
      ,[Diagnosis_code_5]
      ,[Diagnosis_code_6]
      ,[Diagnosis_code_7]
      ,[Diagnosis_code_8]
      ,[Diagnosis_code_9]
      ,[Diagnosis_code_10]
      ,[Diagnosis_code_11]
      ,[Diagnosis_code_12]
      ,[Diagnosis_code_13]
      ,[Diagnosis_code_14]
      ,[Diagnosis_code_15]
      ,[Diagnosis_code_16]
      ,[Diagnosis_code_17]
      ,[Diagnosis_code_18]
      ,[Diagnosis_code_19]
      ,[Diagnosis_code_20]
      ,[ICD Version]
      ,[refering provider ID]
      ,[Billing_provider_id]
      ,[servicing_provider_Id]
      ,[Billing_Provider_NPI]
      ,[Servicing_Provider_NPI]
      ,[Servicing_provider_specialty code]
      ,[Network_ind]
      ,[Network_ID]
      ,[Billed_Amount]
      ,[Company_ID]
      ,[Division_ID]
      ,[Payer_ID]
      ,[Status_ID]
      ,[Employer_Group]
      ,[Medicare_Identifier]
      ,[MDC]
      ,[HOSP_DAYS_CNT]
      ,[CLM_RECV_DT]
      ,[Patient_Status]
      ,[Payment_Tier_Code]
      ,[Services]
      ,[Admission_Indicator]
      ,[Visit_Indicator]
      ,[Claim_Filing_Code]
      ,[Claim_Reporting_Category]
      ,[Policy_Type_Code]
      ,[Claim_Origin_Code]
      ,[CCP_Program_Indicator]
      ,[CCP_Requirement_MET_code]
      ,[Diagnosis_Classification_Code]
      ,[Diagnosis_Category_Code]
      ,[Adjustment_Sequence_Number]
      ,[Payee_Code]
      ,[Bill_Frequency_Code]
      ,[Bill_Institutional_Code]
      ,[RX_ID]
      ,[RX_National_Drug_Code]
      ,[RX_Drug_Name]
      ,[RX_Drug_Type_Code]
      ,[RX_Drug_Category_Code]
      ,[RX_Tier_Level_Code]
      ,[RX_Therapeutic_Class]
      ,[RX_DEA_Number]
      ,[RX_Mail_Order_Indicator]
      ,[RX_Dispense_as_Written]
      ,[RX_Metric_Quantity]
      ,[RX_Days_Supply]
      ,[RX_Origin_Code]
      ,[RX_GPI]
      ,[RX_Generic_Paid_Indicator]
      ,[Rx_Chain_Pharmacy_ID]
      ,[Rx_Formulary_Drug_Indicator]
      ,[RX_Compound_Code]
      ,[Ineligible_Reason_Code_1]
      ,[Ineligible_Reason_Code_2]
      ,[Ineligible_Reason_Code_3]
      ,[Sub_SSN]
      ,[Sub_Last_Name]
      ,[Sub_First_Name]
      ,[Sub_Gender]
      ,[Sub_DOB]
      ,[Sub_Zip]
      ,[Sub_State]
      ,[Patient_First_Name]
      ,[Patient_Last_Name]
      ,[Patiend_DOB]
      ,[Patient_Gender]
      ,[Patient_SSN]
      ,[Patient_Relationship]
      ,[Patient_Middle_Name]
      ,[Patient_Zip_Code]
      ,[Servicing_Provider_ID_(TIN)_Format_Code]
      ,[Servicing_Provider_City]
      ,[Servicing_Provider_Street_Address_1]
      ,[Servicing_Provider_Street_Address_2]
      ,[Servicing_Provider_Name_(Last_or_Full)]
      ,[Servicing_Provider_State]
      ,[Servicing_Provider_Zip_Code]
      ,[Servicing_Provider_PIN]
      ,[Servicing_Provider_Type_*]
      ,[ENCNTR_IND]
      ,[Line_of_Business_Code]
      ,[Hierarchy_Level_1_(Most_Summarized)]
      ,[Hierarchy_Level_2]
      ,[Hierarchy_Level_3]
      ,[Hierarchy_Level_5]
      ,[Hierarchy_Level_6_(Most_Granular)]
      ,[Source_System_Platform]
      ,[Adjustment_Code]
      ,[Preferred_vs_Non-Preferred_Benefit_Level]
      ,[General_Category_of_Health_Plan]
      ,[Classification_Code]
      ,[Benefit_Identification_Code_(BIC)]
      ,[Plan_Code_or_Extension_of_Hierarchy]
      ,[Benefit_Tier]
      ,[Funding_Arrangement]
      ,[Coverage/Enrollment_Tier]
      ,[Member_Relationship_to_Subscriber]
      ,[Source-Specific_Transaction_ID_Number]
      ,[ACAS_Generation/Segment_Number]
      ,[ACAS_Pointer_Back_to_Previous_Gen/Seg]
      ,[Claim_Line_ID_(Assigned_in_Data_Warehouse)]
      ,[Subscriber_Network_ID]
      ,[Servicing_Provider_Network_ID]
      ,[Referral_Type]
      ,[PCP's_IRS_Tax_Identification_Number_(TIN)_Format_Code]
      ,[PCP's_IRS_Tax_Identification_Number_(TIN)]
      ,[PCP's_Name_(Last_or_Full)]
      ,[Assignment_of_Benefits_to_Provider_Code]
      ,[Participating_Provider_Code]
      ,[Date_Processed_(Non-HMO_Only)]
      ,[Service_Benefit_Code_*]
      ,[Tooth_Number]
      ,[Source_Number/Units_of_Service]
      ,[Gross_Submitted_Expense__***]
      ,[Net_Submitted_Expense__***]
      ,[Not_Covered_Amount_1]
      ,[Not_Covered_Amount_2]
      ,[Not_Covered_Amount_3]
      ,[Action_or_Reason_Code_1]
      ,[Action_or_Reason_Code_2]
      ,[Action_or_Reason_Code_3]
      ,[Covered_Expense]
      ,[Source_Copayment_Amount]
      ,[Source_Coinsurance_Amount]
      ,[Benefit_Payable]
      ,[Aetna_Health_Fund_-_Before_Fund_Deductible]
      ,[Aetna_Health_Fund_-_Payable_Amount]
      ,[Savings_-_Negotiated_Fee__***]
      ,[Savings_-_R&C]
      ,[Savings_-_COB]
      ,[Savings_-_Source_COB]
      ,[Medicare_Code]
      ,[Type_of_Expense_-_COB]
      ,[COB_Code]
      ,[National_Drug_Code_*]
      ,[Member_'CUMBID']
      ,[Non-SSN_Subscriber_ID]
      ,[Reversal_Code]
      ,[Administrative_Savings_Amount]
      ,[Aexcel_Provider_Designation_Code]
      ,[Aexcel_Plan_Design_Code]
      ,[Aexcel_Benefit_Tier_Code]
      ,[Aexcel_Designated_Provider_Specialty]
      ,[Product_Distinction_Code]
      ,[Billed_Eligible_Amount_(DO_NOT_USE_IF_UNMASKED)]
      ,[Servicing_Provider_Class_Code_*]
      ,[Present_on_Admission_Code_(1)_*]
      ,[Present_on_Admission_Code_(2)_*]
      ,[Present_on_Admission_Code_(3)_*]
      ,[Pricing_Method_Code]
      ,[Servicing_Provider_Type_Class_Code]
      ,[Servicing_Provider_Specialty_Category_Code_*]
      ,[Total_Deductible_Met_Indicator]
      ,[Total_Interest_Amount]
      ,[Total_Surcharge_Amount]
      ,[HCFA_Place_of_Service_Code_*]
      ,[Line-Level_Procedure_Code_Modifier_(2)_*]
      ,[Line-Level_Procedure_Code_Modifier_(3)_*]
      ,[Present_on_Admission_Code_(4)_*]
      ,[Present_on_Admission_Code_(5)_*]
      ,[Present_on_Admission_Code_(6)_*]
      ,[Present_on_Admission_Code_(7)_*]
      ,[Present_on_Admission_Code_(8)_*]
      ,[Present_on_Admission_Code_(9)_*]
      ,[Present_on_Admission_Code_(10)_*]
      ,[ICD_Procedure_Code_6_*]
      ,[Aetna_Health_Fund_Determination_Order_Code]
      ,[Aetna_Health_Fund_Member_Share_of_Coinsurance_Amount]
      ,[Aetna_Health_Fund_Member_Copay_Amount]
      ,[Aetna_Health_Fund_Member_Deductible_Amount]
      ,[Exchange_ID]
      ,[Claim_Extention]
      ,[Debit_Credit_Code]
      ,[Disposition_Code]
      ,[Procedure_Code3]
      ,[Procedure_Code3_Type]
      ,[Procedure_Code4]
      ,[Procedure_Code4_Type]
      ,[Procedure_Code5]
      ,[Procedure_Code5_Type]
      ,[Trans_Code]
      ,[Adjustment_Type]
      ,[Approved/Denied_code]
      ,[Capitated_service_indicator]
      ,[Department_number]
      ,[CDHP_HRA_Amount]
      ,[Non_covered_amount]
      ,[PCP_Indicator]
      ,[PCP_Zip_code]
      ,[Person_ID]
      ,[Package_number]
      ,[Product_ID]
      ,[Servicing_Provider_Tax_ID]
      ,[Subscriber_ID]
      ,[Employee_coverage_type]
      ,[Subgroup_number]
	  ,[Carrier],[Client],[run_instance_skey],[source_file_skey],[Month],[Year])
select CAST([Account_Number] as bigint ),
[Carrier_Member_ID],
[Claim_ID],
CAST([Claim_Line_ID] as bigint ),
CAST([Service_From_date] as date ),
CAST([Servce_To_date] as date ),
CAST([admission_date] as date ),
CAST([discharge_date] as date ),
[Admission_ID],
[Type_of_Admission],
[Admitting_Diagnosis_Code],
[Admit_source_code],
[Discharge_Status_Code],
Case When IsNumeric([Place of Service Code]) <> 0 THEN CONVERT(bigint,[Place of Service Code]) ELSE NULL end as [Place of Service Code], 
Case When IsNumeric([service Type]) <> 0 THEN CONVERT(bigint,[service Type]) ELSE NULL end as [service Type],
[Line_Of_Business],
[PROC_CODE],
[PROC_CODE_2],
[PROC_CODE_TYPE],
[PROC_CODE_2_TYPE],
[Procedure_Code_Modifier],
[ICD_Proc_code_1],
[ICD_Proc_code_2],
[ICD_Proc_code_3],
[ICD_Proc_code_4],
[ICD_Proc_code_5],
CAST([Paid_date] as date ),
CAST([Paid_amount] as decimal(10,2) ),
CAST([Allowed_amount] as decimal(10,2) ),
CAST([Deductible] as decimal(10,2) ),
CAST([Coinsurance_amount] as decimal(10,2) ),
CAST([Copay_amount] as decimal(10,2) ),
CAST([COB_amount] as decimal(10,2) ),
[Claim_type],
[Bill Type Code],
[Revenue_code],
Case When IsNumeric([DRG]) <> 0 THEN CONVERT(bigint,[DRG]) ELSE NULL end as [DRG],
[MS_DRG],
[Claim_status],
[Units],
[Diagnosis_code_1] ,
[Diagnosis_code_2] ,
[Diagnosis_code_3] ,
[Diagnosis_code_4] ,
[Diagnosis_code_5] ,
[Diagnosis_code_6] ,
[Diagnosis_code_7] ,
[Diagnosis_code_8] ,
[Diagnosis_code_9] ,
[Diagnosis_code_10],
[Diagnosis_code_11],
[Diagnosis_code_12],
[Diagnosis_code_13],
[Diagnosis_code_14],
[Diagnosis_code_15],
[Diagnosis_code_16],
[Diagnosis_code_17],
[Diagnosis_code_18],
[Diagnosis_code_19],
[Diagnosis_code_20],
CAST([ICD Version] as bigint ),
[refering provider ID],
[Billing_provider_id],
[servicing_provider_Id],
[Billing_Provider_NPI],
[Servicing_Provider_NPI],
[Servicing_provider_specialty code],
[Network_ind],
[Network_ID],
[Billed_Amount],
[Company_ID],
[Division_ID],
[Payer_ID],
[Status_ID],
[Employer_Group],
[Medicare_Identifier],
Case When IsNumeric([MDC]) <> 0 THEN CONVERT(bigint,[MDC]) ELSE NULL end as [MDC],
CAST([HOSP_DAYS_CNT] as bigint ),
[CLM_RECV_DT],
Case When IsNumeric([Patient_Status]) <> 0 THEN CONVERT(bigint,[Patient_Status]) ELSE NULL end as [Patient_Status],
CAST([Payment_Tier_Code] as bigint ),
CAST([Services] as bigint ),
CAST([Admission_Indicator] as bigint ),
CAST([Visit_Indicator] as bigint ),
CAST([Claim_Filing_Code] as bigint ),
Case When IsNumeric([Claim_Reporting_Category]) <> 0 THEN CONVERT(bigint,[Claim_Reporting_Category]) ELSE NULL end as [Claim_Reporting_Category],
CAST([Policy_Type_Code] as bigint ),
[Claim_Origin_Code],
Case When IsNumeric([CCP_Program_Indicator]) <> 0 THEN CONVERT(bigint,[CCP_Program_Indicator]) ELSE NULL end as [CCP_Program_Indicator],
CAST([CCP_Requirement_MET_code] as bigint ),
[Diagnosis_Classification_Code],
CAST([Diagnosis_Category_Code] as bigint ),
CAST([Adjustment_Sequence_Number] as bigint ),
CAST([Payee_Code] as bigint ),
Case When IsNumeric([Bill_Frequency_Code]) <> 0 THEN CONVERT(bigint,[Bill_Frequency_Code]) ELSE NULL end as [Bill_Frequency_Code],
Case When IsNumeric([Bill_Institutional_Code]) <> 0 THEN CONVERT(bigint,[Bill_Institutional_Code]) ELSE NULL end as [Bill_Institutional_Code],
CAST([RX_ID] as bigint ),
Case When IsNumeric([RX_National_Drug_Code]) <> 0 THEN CONVERT(bigint,[RX_National_Drug_Code]) ELSE NULL end as [RX_National_Drug_Code],
[RX_Drug_Name],
CAST([RX_Drug_Type_Code] as bigint ),
[RX_Drug_Category_Code],
CAST([RX_Tier_Level_Code] as bigint ),
CAST([RX_Therapeutic_Class] as bigint ),
[RX_DEA_Number],
[RX_Mail_Order_Indicator],
CAST([RX_Dispense_as_Written] as bigint ),
CAST([RX_Metric_Quantity] as decimal(10,2) ),
CAST([RX_Days_Supply] as decimal(10,2) ),
Case When IsNumeric([RX_Origin_Code]) <> 0 THEN CONVERT(bigint,[RX_Origin_Code]) ELSE NULL end as [RX_Origin_Code],
[RX_GPI],
[RX_Generic_Paid_Indicator],
Case When IsNumeric([Rx_Chain_Pharmacy_ID]) <> 0 THEN CONVERT(bigint,[Rx_Chain_Pharmacy_ID]) ELSE NULL end as [RX_Chain_Pharmacy_ID],
[Rx_Formulary_Drug_Indicator],
CAST([RX_Compound_Code] as bigint ),
[Ineligible_Reason_Code_1],
[Ineligible_Reason_Code_2],
[Ineligible_Reason_Code_3],
Case When IsNumeric([Sub_SSN]) <> 0 THEN CONVERT(bigint,[Sub_SSN]) ELSE NULL end as [Sub_SSN],
[Sub_Last_Name],
[Sub_First_Name],
[Sub_Gender],
CAST([Sub_DOB] as date ),
Case When IsNumeric([Sub_Zip]) <> 0 THEN CONVERT(bigint,[Sub_Zip]) ELSE NULL end as [Sub_Zip],
[Sub_State],
[Patient_First_Name],
[Patient_Last_Name],
CAST([Patiend_DOB] as date ),
[Patient_Gender],
Case When IsNumeric([Patient_SSN]) <> 0 THEN CONVERT(bigint,[Patient_SSN]) ELSE NULL end as [Patient_SSN],
[Patient_Relationship],
[Patient_Middle_Name] ,
Case When IsNumeric([Patient_Zip_Code]) <> 0 THEN CONVERT(bigint,[Patient_Zip_Code]) ELSE NULL end as [Patient_Zip_Code],
[Servicing_Provider_ID_(TIN)_Format_Code],
[Servicing_Provider_City],
[Servicing_Provider_Street_Address_1],
[Servicing_Provider_Street_Address_2],
[Servicing_Provider_Name_(Last_or_Full)],
[Servicing_Provider_State],
[Servicing_Provider_Zip_Code],
[Servicing_Provider_PIN],
[Servicing_Provider_Type_*],
[ENCNTR_IND],
[Line_of_Business_Code],
[Hierarchy_Level_1_(Most_Summarized)],
[Hierarchy_Level_2],
Case When IsNumeric([Hierarchy_Level_3]) <> 0 THEN CONVERT(bigint,[Hierarchy_Level_3]) ELSE NULL end as [Hierarchy_Level_3],
Case When IsNumeric([Hierarchy_Level_5]) <> 0 THEN CONVERT(bigint,[Hierarchy_Level_5]) ELSE NULL end as [Hierarchy_Level_5],
[Hierarchy_Level_6_(Most_Granular)] ,
[Source_System_Platform] ,
[Adjustment_Code] ,
[Preferred_vs_Non-Preferred_Benefit_Level] ,
[General_Category_of_Health_Plan] ,
[Classification_Code] ,
[Benefit_Identification_Code_(BIC)] ,
[Plan_Code_or_Extension_of_Hierarchy] ,
[Benefit_Tier] ,
[Funding_Arrangement] ,
[Coverage/Enrollment_Tier] ,
[Member_Relationship_to_Subscriber] ,
[Source-Specific_Transaction_ID_Number] ,
[ACAS_Generation/Segment_Number] ,
[ACAS_Pointer_Back_to_Previous_Gen/Seg] ,
[Claim_Line_ID_(Assigned_in_Data_Warehouse)] ,
[Subscriber_Network_ID] ,
[Servicing_Provider_Network_ID] ,
[Referral_Type] ,
[PCP's_IRS_Tax_Identification_Number_(TIN)_Format_Code] ,
[PCP's_IRS_Tax_Identification_Number_(TIN)] ,
[PCP's_Name_(Last_or_Full)] ,
[Assignment_of_Benefits_to_Provider_Code] ,
[Participating_Provider_Code] ,
[Date_Processed_(Non-HMO_Only)] ,
[Service_Benefit_Code_*] ,
[Tooth_Number] ,
[Source_Number/Units_of_Service] ,
[Gross_Submitted_Expense__***] ,
[Net_Submitted_Expense__***] ,
[Not_Covered_Amount_1] ,
[Not_Covered_Amount_2] ,
[Not_Covered_Amount_3] ,
[Action_or_Reason_Code_1] ,
[Action_or_Reason_Code_2] ,
[Action_or_Reason_Code_3] ,
[Covered_Expense] ,
[Source_Copayment_Amount] ,
[Source_Coinsurance_Amount] ,
[Benefit_Payable] ,
[Aetna_Health_Fund_-_Before_Fund_Deductible] ,
[Aetna_Health_Fund_-_Payable_Amount] ,
[Savings_-_Negotiated_Fee__***] ,
[Savings_-_R&C] ,
[Savings_-_COB] ,
[Savings_-_Source_COB] ,
[Medicare_Code] ,
[Type_of_Expense_-_COB] ,
[COB_Code] ,
[National_Drug_Code_*] ,
[Member_'CUMBID'] ,
[Non-SSN_Subscriber_ID] ,
[Reversal_Code] ,
[Administrative_Savings_Amount] ,
[Aexcel_Provider_Designation_Code] ,
[Aexcel_Plan_Design_Code] ,
[Aexcel_Benefit_Tier_Code] ,
[Aexcel_Designated_Provider_Specialty] ,
[Product_Distinction_Code] ,
[Billed_Eligible_Amount_(DO_NOT_USE_IF_UNMASKED)] ,
[Servicing_Provider_Class_Code_*] ,
[Present_on_Admission_Code_(1)_*] ,
[Present_on_Admission_Code_(2)_*] ,
[Present_on_Admission_Code_(3)_*] ,
[Pricing_Method_Code] ,
[Servicing_Provider_Type_Class_Code] ,
[Servicing_Provider_Specialty_Category_Code_*] ,
[Total_Deductible_Met_Indicator] ,
[Total_Interest_Amount] ,
[Total_Surcharge_Amount] ,
[HCFA_Place_of_Service_Code_*] ,
[Line-Level_Procedure_Code_Modifier_(2)_*] ,
[Line-Level_Procedure_Code_Modifier_(3)_*] ,
[Present_on_Admission_Code_(4)_*] ,
[Present_on_Admission_Code_(5)_*] ,
[Present_on_Admission_Code_(6)_*] ,
[Present_on_Admission_Code_(7)_*] ,
[Present_on_Admission_Code_(8)_*] ,
[Present_on_Admission_Code_(9)_*] ,
[Present_on_Admission_Code_(10)_*] ,
[ICD_Procedure_Code_6_*] ,
[Aetna_Health_Fund_Determination_Order_Code] ,
[Aetna_Health_Fund_Member_Share_of_Coinsurance_Amount] ,
[Aetna_Health_Fund_Member_Copay_Amount] ,
[Aetna_Health_Fund_Member_Deductible_Amount] ,
[Exchange_ID] ,
[Claim_Extention] ,
[Debit_Credit_Code] ,
[Disposition_Code] ,
[Procedure_Code3] ,
[Procedure_Code3_Type] ,
[Procedure_Code4] ,
[Procedure_Code4_Type] ,
[Procedure_Code5] ,
[Procedure_Code5_Type] ,
[Trans_Code] ,
[Adjustment_Type] ,
[Approved/Denied_code] ,
[Capitated_service_indicator] ,
[Department_number] ,
[CDHP_HRA_Amount] ,
[Non_covered_amount] ,
[PCP_Indicator] ,
[PCP_Zip_code] ,
[Person_ID] ,
[Package_number] ,
[Product_ID] ,
[Servicing_Provider_Tax_ID] ,
[Subscriber_ID] ,
[Employee_coverage_type] ,
[Subgroup_number],
@Carrier,@Client,@run_instance_skey,@source_file_skey,@month,@year

FROM land.tbl_medical_claim

TRUNCATE table land.tbl_medical_claim

END


select top(100)* from stg.tbl_medical_claim