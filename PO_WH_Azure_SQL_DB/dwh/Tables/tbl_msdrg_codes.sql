CREATE TABLE [dwh].[tbl_msdrg_codes] (
    [seq_key]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [ms_drg]                 BIGINT        NULL,
    [mdc]                    VARCHAR (10)  NULL,
    [type]                   VARCHAR (10)  NULL,
    [ms_drg_title]           VARCHAR (500) NULL,
    [run_instance_skey]      BIGINT        NULL,
    [source_file_skey]       BIGINT        NULL,
    [stg_inserted_timestamp] DATETIME      DEFAULT (getdate()) NOT NULL
);

