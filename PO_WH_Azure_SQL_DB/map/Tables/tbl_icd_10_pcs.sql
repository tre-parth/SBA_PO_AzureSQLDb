CREATE TABLE [map].[tbl_icd_10_pcs] (
    [icd_10_cd_skey]                BIGINT   IDENTITY (1, 1) NOT NULL,
    [icd_10_pcs_code]               BIGINT   NOT NULL,
    [description]                   TEXT     NOT NULL,
    [run_instance_skey]             BIGINT   NULL,
    [source_file_skey]              BIGINT   NULL,
    [icd_10_pcs_inserted_timestamp] DATETIME NOT NULL,
    [icd_10_pcs_updated_timestamp]  DATETIME NOT NULL,
    [icd_status]                    SMALLINT NOT NULL
);

