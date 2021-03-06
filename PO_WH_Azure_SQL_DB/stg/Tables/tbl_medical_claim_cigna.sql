﻿CREATE TABLE [stg].[tbl_medical_claim_cigna] (
    [Member Number]                  VARCHAR (11) NULL,
    [Subscriber/Employee SSN]        VARCHAR (9)  NULL,
    [Member First Name]              VARCHAR (20) NULL,
    [Member Last Name]               VARCHAR (30) NULL,
    [Member date of birth]           DATE         NULL,
    [Member sex]                     VARCHAR (1)  NULL,
    [Account Number]                 BIGINT       NULL,
    [Provider Tax ID]                BIGINT       NULL,
    [Provider City]                  VARCHAR (30) NULL,
    [Provider Address (First Line)]  VARCHAR (35) NULL,
    [Provider Address (Second Line)] VARCHAR (35) NULL,
    [Provider Name]                  VARCHAR (65) NULL,
    [Provider State]                 VARCHAR (2)  NULL,
    [Provider Zip]                   VARCHAR (10) NULL,
    [Provider Specialty Code]        VARCHAR (2)  NULL,
    [Deductible Amount]              VARCHAR (11) NULL,
    [Paid Amount]                    VARCHAR (11) NULL,
    [Copay Amount]                   VARCHAR (11) NULL,
    [Coinsurance Amount]             VARCHAR (11) NULL,
    [Type of Service]                VARCHAR (3)  NULL,
    [Amount Paid By Other Carrier]   VARCHAR (11) NULL,
    [Primary Diagnosis]              VARCHAR (10) NULL,
    [Other Diagnosis 1]              VARCHAR (10) NULL,
    [Other Diagnosis 2]              VARCHAR (10) NULL,
    [ICD Version Number]             VARCHAR (2)  NULL,
    [First Service Date]             DATE         NULL,
    [Inventory Number]               VARCHAR (16) NULL,
    [Claim Line Number]              BIGINT       NULL,
    [Claim Received Date]            DATE         NULL,
    [Paid/Processed Date]            DATE         NULL,
    [Procedure Code Indicator]       VARCHAR (2)  NULL,
    [Place of Service]               VARCHAR (2)  NULL,
    [Procedure Code]                 VARCHAR (5)  NULL,
    [CPT Modifier Code]              VARCHAR (4)  NULL,
    [Units of Service on Claim]      BIGINT       NULL,
    [Last Date of Service]           DATE         NULL,
    [Medicare Indicator]             VARCHAR (1)  NULL,
    [Encounter Indicator]            VARCHAR (1)  NULL,
    [Admit Date]                     DATE         NULL,
    [Hospital Days Count]            INT          NULL,
    [Discharge Status Code]          VARCHAR (2)  NULL,
    [DRG Code]                       VARCHAR (3)  NULL,
    [MS DRG Code]                    VARCHAR (3)  NULL
);

