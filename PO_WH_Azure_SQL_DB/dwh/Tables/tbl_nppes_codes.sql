CREATE TABLE [dwh].[tbl_nppes_codes] (
    [seq_key]                BIGINT       IDENTITY (1, 1) NOT NULL,
    [prov_npi]               BIGINT       NULL,
    [prov_nm]                VARCHAR (70) NULL,
    [prov_city]              VARCHAR (40) NULL,
    [prv_addr1]              VARCHAR (55) NULL,
    [prv_addr2]              VARCHAR (55) NULL,
    [prov_st]                VARCHAR (40) NULL,
    [prov_zip]               VARCHAR (20) NULL,
    [prov_type]              VARCHAR (10) NULL,
    [run_instance_skey]      BIGINT       NULL,
    [source_file_skey]       BIGINT       NULL,
    [stg_inserted_timestamp] DATETIME     DEFAULT (getdate()) NOT NULL
);

