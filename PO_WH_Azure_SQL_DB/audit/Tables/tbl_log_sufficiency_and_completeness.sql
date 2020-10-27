CREATE TABLE [audit].[tbl_log_sufficiency_and_completeness] (
    [S.No.]              INT           IDENTITY (1, 1) NOT NULL,
    [source_file_key]    VARCHAR (50)  NULL,
    [source_file_name]   VARCHAR (100) NULL,
    [source_file_type]   VARCHAR (20)  NULL,
    [Carrier]            VARCHAR (100) NULL,
    [Client]             VARCHAR (100) NULL,
    [column_header]      VARCHAR (100) NULL,
    [required]           VARCHAR (20)  NULL,
    [message]            VARCHAR (200) NULL,
    [year]               INT           NULL,
    [month]              INT           NULL,
    [date_inserted_time] DATETIME      NULL,
    [Date_Updated]       DATETIME      CONSTRAINT [DF_tbl_log_sufficiency_and_completeness_Date_Updated] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tbl_log_sufficiency_and_completeness_1] PRIMARY KEY CLUSTERED ([S.No.] ASC)
);

