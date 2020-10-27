﻿CREATE TABLE [land].[Test_tbl_medical_claim_HCSC] (
    [Account_Number]                NVARCHAR (MAX) NULL,
    [Claim_Number]                  NVARCHAR (MAX) NULL,
    [Claim_Extention]               NVARCHAR (MAX) NULL,
    [Line_Number]                   NVARCHAR (MAX) NULL,
    [Line_of_Business_Code]         NVARCHAR (MAX) NULL,
    [First_Date_of_Service]         NVARCHAR (MAX) NULL,
    [Paid_Date]                     NVARCHAR (MAX) NULL,
    [Debit_Credit_Code]             NVARCHAR (MAX) NULL,
    [Member_Key]                    NVARCHAR (MAX) NULL,
    [Disposition_Code]              NVARCHAR (MAX) NULL,
    [Group_Number]                  NVARCHAR (MAX) NULL,
    [Section_Number]                NVARCHAR (MAX) NULL,
    [Subscriber_ID]                 NVARCHAR (MAX) NULL,
    [Subscriber_SSN]                NVARCHAR (MAX) NULL,
    [Patient_DOB]                   NVARCHAR (MAX) NULL,
    [Patient_SSN]                   NVARCHAR (MAX) NULL,
    [Patient_Gender]                NVARCHAR (MAX) NULL,
    [Patient_Relationship]          NVARCHAR (MAX) NULL,
    [Patient_First_Name]            NVARCHAR (MAX) NULL,
    [Patient_Middle_Name]           NVARCHAR (MAX) NULL,
    [Patient_Last_Name]             NVARCHAR (MAX) NULL,
    [Patient_Zip_Code]              NVARCHAR (MAX) NULL,
    [Medicare_Primary_Indicator]    NVARCHAR (MAX) NULL,
    [Ineligible_Reason_Code_1]      NVARCHAR (MAX) NULL,
    [Ineligible_Reason_Code_2]      NVARCHAR (MAX) NULL,
    [Ineligible_Reason_Code_3]      NVARCHAR (MAX) NULL,
    [Last_Date_of_Service]          NVARCHAR (MAX) NULL,
    [Admission_Date]                NVARCHAR (MAX) NULL,
    [Discharge_Date]                NVARCHAR (MAX) NULL,
    [Received_Date]                 NVARCHAR (MAX) NULL,
    [Procedure_Code_Modifier]       NVARCHAR (MAX) NULL,
    [Policy_Type_Code]              NVARCHAR (MAX) NULL,
    [Claim_Origin_Code]             NVARCHAR (MAX) NULL,
    [CCP_Program_Indicator]         NVARCHAR (MAX) NULL,
    [CCP_Requirement_MET_code]      NVARCHAR (MAX) NULL,
    [Diagnosis_Classification_Code] NVARCHAR (MAX) NULL,
    [Diagnosis_Category_Code]       NVARCHAR (MAX) NULL,
    [Diagnosis_Code_1]              NVARCHAR (MAX) NULL,
    [Diagnosis_Code_2]              NVARCHAR (MAX) NULL,
    [Diagnosis_Code_3]              NVARCHAR (MAX) NULL,
    [Diagnosis_Code_4]              NVARCHAR (MAX) NULL,
    [Diagnosis_Code_5]              NVARCHAR (MAX) NULL,
    [HCPCS_CPT_Code]                NVARCHAR (MAX) NULL,
    [Revenue_Code]                  NVARCHAR (MAX) NULL,
    [ICD_Version_Code]              NVARCHAR (MAX) NULL,
    [ICD_Procedure_Code_1]          NVARCHAR (MAX) NULL,
    [ICD_Procedure_Code_2]          NVARCHAR (MAX) NULL,
    [ICD_Procedure_Code_3]          NVARCHAR (MAX) NULL,
    [Place_of_Treatment]            NVARCHAR (MAX) NULL,
    [Type_of_Service]               NVARCHAR (MAX) NULL,
    [DRG]                           NVARCHAR (MAX) NULL,
    [MDC]                           NVARCHAR (MAX) NULL,
    [Patient_Status]                NVARCHAR (MAX) NULL,
    [Payment_Tier_Code]             NVARCHAR (MAX) NULL,
    [Services]                      NVARCHAR (MAX) NULL,
    [Admission_Indicator]           NVARCHAR (MAX) NULL,
    [Day_Count]                     NVARCHAR (MAX) NULL,
    [Visit_Indicator]               NVARCHAR (MAX) NULL,
    [Filler1]                       NVARCHAR (MAX) NULL,
    [Filler2]                       NVARCHAR (MAX) NULL,
    [Filler3]                       NVARCHAR (MAX) NULL,
    [Deductible_Amount]             NVARCHAR (MAX) NULL,
    [Coinsurance_Amount]            NVARCHAR (MAX) NULL,
    [Copay_Amount]                  NVARCHAR (MAX) NULL,
    [Paid_Amount]                   NVARCHAR (MAX) NULL,
    [Filler4]                       NVARCHAR (MAX) NULL,
    [Filler5]                       NVARCHAR (MAX) NULL,
    [Filler6]                       NVARCHAR (MAX) NULL,
    [Filler7]                       NVARCHAR (MAX) NULL,
    [Filler8]                       NVARCHAR (MAX) NULL,
    [Filler9]                       NVARCHAR (MAX) NULL,
    [Filler10]                      NVARCHAR (MAX) NULL,
    [Filler11]                      NVARCHAR (MAX) NULL,
    [Claim_Filing_Code]             NVARCHAR (MAX) NULL,
    [Adjustment_Sequence_Number]    NVARCHAR (MAX) NULL,
    [Procedure_Code_Modifier2]      NVARCHAR (MAX) NULL,
    [Payee_Code]                    NVARCHAR (MAX) NULL,
    [Bill_Type_Class_Code]          NVARCHAR (MAX) NULL,
    [Bill_Frequency_Code]           NVARCHAR (MAX) NULL,
    [Bill_Institutional_Code]       NVARCHAR (MAX) NULL,
    [Filler12]                      NVARCHAR (MAX) NULL,
    [Filler13]                      NVARCHAR (MAX) NULL,
    [Filler14]                      NVARCHAR (MAX) NULL,
    [Filler15]                      NVARCHAR (MAX) NULL,
    [Filler16]                      NVARCHAR (MAX) NULL,
    [Filler17]                      NVARCHAR (MAX) NULL,
    [Filler18]                      NVARCHAR (MAX) NULL,
    [Filler19]                      NVARCHAR (MAX) NULL,
    [Filler20]                      NVARCHAR (MAX) NULL,
    [Filler21]                      NVARCHAR (MAX) NULL,
    [Filler22]                      NVARCHAR (MAX) NULL,
    [Filler23]                      NVARCHAR (MAX) NULL,
    [Filler24]                      NVARCHAR (MAX) NULL,
    [Filler25]                      NVARCHAR (MAX) NULL,
    [Filler26]                      NVARCHAR (MAX) NULL,
    [Filler27]                      NVARCHAR (MAX) NULL,
    [Filler28]                      NVARCHAR (MAX) NULL,
    [Filler29]                      NVARCHAR (MAX) NULL,
    [Filler30]                      NVARCHAR (MAX) NULL,
    [Filler31]                      NVARCHAR (MAX) NULL,
    [Filler32]                      NVARCHAR (MAX) NULL,
    [Filler33]                      NVARCHAR (MAX) NULL,
    [Filler34]                      NVARCHAR (MAX) NULL,
    [Filler35]                      NVARCHAR (MAX) NULL,
    [RX_ID]                         NVARCHAR (MAX) NULL,
    [RX_National_Drug_Code]         NVARCHAR (MAX) NULL,
    [RX_Drug_Name]                  NVARCHAR (MAX) NULL,
    [RX_Drug_Type_Code]             NVARCHAR (MAX) NULL,
    [RX_Drug_Category_Code]         NVARCHAR (MAX) NULL,
    [RX_Tier_Level_Code]            NVARCHAR (MAX) NULL,
    [RX_Therapeutic_Class]          NVARCHAR (MAX) NULL,
    [RX_DEA_Number]                 NVARCHAR (MAX) NULL,
    [RX_Mail_Order_Indicator]       NVARCHAR (MAX) NULL,
    [RX_Dispense_as_Written]        NVARCHAR (MAX) NULL,
    [Filler36]                      NVARCHAR (MAX) NULL,
    [Filler37]                      NVARCHAR (MAX) NULL,
    [Filler38]                      NVARCHAR (MAX) NULL,
    [RX_Metric_Quantity]            NVARCHAR (MAX) NULL,
    [RX_Days_Supply]                NVARCHAR (MAX) NULL,
    [RX_Origin_Code]                NVARCHAR (MAX) NULL,
    [RX_GPI]                        NVARCHAR (MAX) NULL,
    [RX_Generic_Paid_Indicator]     NVARCHAR (MAX) NULL,
    [Rx_Chain_Pharmacy_ID]          NVARCHAR (MAX) NULL,
    [Rx_Formulary_Drug_Indicator]   NVARCHAR (MAX) NULL,
    [RX_Compound_Code]              NVARCHAR (MAX) NULL,
    [Filler39]                      NVARCHAR (MAX) NULL,
    [Filler40]                      NVARCHAR (MAX) NULL,
    [Filler41]                      NVARCHAR (MAX) NULL,
    [Filler42]                      NVARCHAR (MAX) NULL,
    [Filler43]                      NVARCHAR (MAX) NULL,
    [Filler44]                      NVARCHAR (MAX) NULL
);

