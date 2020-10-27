CREATE TABLE [m].[tbl_config_column_mapping] (
    [seq_key]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [database_name]      VARCHAR (100) NOT NULL,
    [source_schema_name] VARCHAR (10)  NOT NULL,
    [source_table_name]  VARCHAR (100) NOT NULL,
    [target_schema_name] VARCHAR (100) NOT NULL,
    [target_table_name]  VARCHAR (100) NOT NULL,
    [rec_insert_dt]      DATETIME      DEFAULT (getdate()) NULL,
    [rec_update_dt]      DATETIME      DEFAULT (getdate()) NULL
);

