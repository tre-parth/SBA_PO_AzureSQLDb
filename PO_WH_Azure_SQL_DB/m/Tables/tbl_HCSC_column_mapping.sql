CREATE TABLE [m].[tbl_HCSC_column_mapping] (
    [S.No.]                INT            IDENTITY (1, 1) NOT NULL,
    [Column #]             NVARCHAR (MAX) NULL,
    [Field Name]           NVARCHAR (MAX) NULL,
    [Field Description]    NVARCHAR (MAX) NULL,
    [Field
Type]           NVARCHAR (MAX) NULL,
    [Maximum Field Length] NVARCHAR (MAX) NULL,
    [Code
Set]             NVARCHAR (MAX) NULL,
    [Date_Inserted]        DATETIME       CONSTRAINT [DF_tbl_HCSC_column_mapping_Date_Inserted] DEFAULT (getdate()) NULL,
    [Date_Updated]         DATETIME       CONSTRAINT [DF_tbl_HCSC_column_mapping_Date_Updated] DEFAULT (getdate()) NULL
);

