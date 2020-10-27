CREATE TABLE [m].[tbl_column_mapping] (
    [S.No.]                  INT            IDENTITY (1, 1) NOT NULL,
    [LEGEND]                 NVARCHAR (MAX) NULL,
    [NEW PO Request for WH]  NVARCHAR (MAX) NULL,
    [CIGNA]                  NVARCHAR (MAX) NULL,
    [AETNA]                  NVARCHAR (MAX) NULL,
    [HCSC]                   NVARCHAR (MAX) NULL,
    [Verscend]               NVARCHAR (MAX) NULL,
    [CM Claims Data Request] NVARCHAR (MAX) NULL,
    [Medica]                 NVARCHAR (MAX) NULL,
    [Anthem]                 NVARCHAR (MAX) NULL,
    [RightOpt (Truven)]      NVARCHAR (MAX) NULL,
    [Date_Inserted]          DATETIME       CONSTRAINT [DF_tbl_column_mapping_Date_Inserted] DEFAULT (getdate()) NULL,
    [Date_Updated]           DATETIME       CONSTRAINT [DF_tbl_column_mapping_Date_Updated] DEFAULT (getdate()) NULL
);

