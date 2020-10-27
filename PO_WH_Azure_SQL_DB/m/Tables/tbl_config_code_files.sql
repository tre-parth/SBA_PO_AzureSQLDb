CREATE TABLE [m].[tbl_config_code_files] (
    [seq_key]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [source_file]        VARCHAR (100) NOT NULL,
    [source_file_path]   TEXT          NOT NULL,
    [archive_file_path]  TEXT          NOT NULL,
    [reject_file_path]   TEXT          NOT NULL,
    [database_name]      VARCHAR (100) NOT NULL,
    [source_schema_name] VARCHAR (10)  NOT NULL,
    [source_table_name]  VARCHAR (100) NOT NULL,
    [target_schema_name] VARCHAR (100) NOT NULL,
    [target_table_name]  VARCHAR (100) NOT NULL,
    [report_schema_name] VARCHAR (100) NULL,
    [report_table_name]  VARCHAR (100) NULL
);

