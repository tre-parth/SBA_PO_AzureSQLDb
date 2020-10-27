CREATE TABLE [m].[tbl_config_code_files_v2] (
    [seq_key]                 BIGINT        IDENTITY (1, 1) NOT NULL,
    [source_file]             VARCHAR (100) NOT NULL,
    [container_name]          VARCHAR (100) NOT NULL,
    [source_file_path]        TEXT          NOT NULL,
    [archive_file_path]       TEXT          NOT NULL,
    [reject_file_path]        TEXT          NOT NULL,
    [source_file_name]        VARCHAR (100) NOT NULL,
    [sheet_name]              VARCHAR (100) NOT NULL,
    [database_name]           VARCHAR (100) NOT NULL,
    [target_schema_name]      VARCHAR (100) NOT NULL,
    [target_table_name]       VARCHAR (100) NOT NULL,
    [stored_procedure_schema] VARCHAR (100) NOT NULL,
    [stored_procedure_name]   VARCHAR (100) NOT NULL
);

