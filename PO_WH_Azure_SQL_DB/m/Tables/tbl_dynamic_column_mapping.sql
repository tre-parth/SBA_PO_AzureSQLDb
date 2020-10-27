CREATE TABLE [m].[tbl_dynamic_column_mapping] (
    [seq_key]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [source_schema_name] VARCHAR (10)  NULL,
    [table_name]         VARCHAR (100) NULL,
    [source_column]      VARCHAR (100) NOT NULL,
    [target_column]      VARCHAR (100) NULL,
    [rec_insert_dt]      DATETIME      DEFAULT (getdate()) NULL,
    [rec_update_dt]      DATETIME      DEFAULT (getdate()) NULL
);

