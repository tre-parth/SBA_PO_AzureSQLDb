﻿CREATE TABLE [stg].[tbl_medical_claim_CHPS_Cerner] (
    [Member_ID]                VARCHAR (11) NULL,
    [Claim_Number]             VARCHAR (20) NULL,
    [Claim_Detail_Line_Number] VARCHAR (3)  NULL,
    [Claim_Service_Begin_Date] DATE         NULL,
    [Claim_Service_End_Date]   DATE         NULL,
    [Procedure_Code_1]         VARCHAR (5)  NULL,
    [Procedure_Code_1_Type]    VARCHAR (14) NULL,
    [Procedure_Code_2]         VARCHAR (7)  NULL,
    [Procedure_Code_2_Type]    VARCHAR (12) NULL,
    [Procedure_Code_3]         VARCHAR (7)  NULL,
    [Procedure_Code_3_Type]    VARCHAR (12) NULL,
    [Procedure_Code_4]         VARCHAR (7)  NULL,
    [Procedure_Code_4_Type]    VARCHAR (12) NULL,
    [Procedure_Code_5]         VARCHAR (7)  NULL,
    [Procedure_Code_5_Type]    VARCHAR (12) NULL,
    [Paid_Date]                DATE         NULL,
    [Paid_Amount]              VARCHAR (10) NULL,
    [Allowed_Amount]           VARCHAR (10) NULL,
    [Deductible]               VARCHAR (10) NULL,
    [Coinsurance]              VARCHAR (10) NULL,
    [Copay]                    VARCHAR (10) NULL,
    [Claim_Type]               VARCHAR (20) NULL,
    [Bill_Type]                VARCHAR (10) NULL,
    [Revenue_Code]             VARCHAR (10) NULL,
    [Claim_Status]             VARCHAR (10) NULL,
    [Type_of_Admission]        VARCHAR (1)  NULL,
    [Diagnosis_Code_One]       VARCHAR (10) NULL,
    [Diagnosis_Code_Two]       VARCHAR (10) NULL,
    [Diagnosis_Code_Three]     VARCHAR (10) NULL,
    [Diagnosis_Code_Four]      VARCHAR (10) NULL,
    [Diagnosis_Code_Five]      VARCHAR (10) NULL,
    [Diagnosis_Code_Six]       VARCHAR (10) NULL,
    [Diagnosis_Code_Seven]     VARCHAR (10) NULL,
    [Diagnosis_Code_Eight]     VARCHAR (10) NULL,
    [Diagnosis_Code_Nine]      VARCHAR (10) NULL,
    [Diagnosis_Code_Ten]       VARCHAR (10) NULL,
    [Diagnosis_Code_Eleven]    VARCHAR (10) NULL,
    [Diagnosis_Code_Twelve]    VARCHAR (10) NULL,
    [Diagnosis_Code_Thirteen]  VARCHAR (10) NULL,
    [Diagnosis_Code_Fourteen]  VARCHAR (10) NULL,
    [Diagnosis_Code_Fifteen]   VARCHAR (10) NULL,
    [Diagnosis_Code_Sixteen]   VARCHAR (10) NULL,
    [Diagnosis_Code_Seventeen] VARCHAR (10) NULL,
    [Diagnosis_Code_Eighteen]  VARCHAR (10) NULL,
    [Diagnosis_Code_Nineteen]  VARCHAR (10) NULL,
    [Diagnosis_Code_Twenty]    VARCHAR (10) NULL
);

