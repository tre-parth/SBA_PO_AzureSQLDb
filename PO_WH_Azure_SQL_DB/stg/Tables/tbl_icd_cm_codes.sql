CREATE TABLE [stg].[tbl_icd_cm_codes] (
    [seq_key]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [icd_cd]                 VARCHAR (100) NULL,
    [description]            VARCHAR (500) NULL,
    [run_instance_skey]      BIGINT        NULL,
    [source_file_skey]       BIGINT        NULL,
    [stg_inserted_timestamp] DATETIME      DEFAULT (getdate()) NOT NULL
);

