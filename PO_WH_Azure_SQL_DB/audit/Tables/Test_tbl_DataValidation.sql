CREATE TABLE [audit].[Test_tbl_DataValidation] (
    [S.No.]                             INT             IDENTITY (1, 1) NOT NULL,
    [Account_ID]                        INT             NULL,
    [File_Name]                         VARCHAR (100)   NULL,
    [Paid_Period_Expected]              VARCHAR (100)   NULL,
    [Paid_Period_Actual]                VARCHAR (100)   NULL,
    [Record_Count_Expected]             INT             NULL,
    [Record_Count_Actual]               INT             NULL,
    [Total_Deductible_Amount_Expected]  DECIMAL (38, 2) NULL,
    [Total_Deductible_Amount_Actual]    DECIMAL (38, 2) NULL,
    [Total_Coinsurance_Amount_Expected] DECIMAL (38, 2) NULL,
    [Total_Coinsurance_Amount_Actual]   DECIMAL (38, 2) NULL,
    [Total_Copay_Amount_Expected]       DECIMAL (38, 2) NULL,
    [Total_Copay_Amount_Actual]         DECIMAL (38, 2) NULL,
    [Total_Paid_Amount_Expected]        DECIMAL (38, 2) NULL,
    [Total_Paid_Amount_Actual]          DECIMAL (38, 2) NULL,
    [Flag]                              VARCHAR (100)   NULL,
    [Month]                             INT             NULL,
    [Year]                              INT             NULL,
    PRIMARY KEY CLUSTERED ([S.No.] ASC)
);

