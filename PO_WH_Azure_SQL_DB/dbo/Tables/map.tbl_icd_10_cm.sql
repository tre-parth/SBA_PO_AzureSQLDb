CREATE TABLE [dbo].[map.tbl_icd_10_cm] (
    [icd_10_cd_skey]            BIGINT   IDENTITY (1, 1) NOT NULL,
    [icd_10_code]               TEXT     NOT NULL,
    [description]               TEXT     NOT NULL,
    [run_instance_skey]         BIGINT   NULL,
    [source_file_skey]          BIGINT   NULL,
    [icd_10_inserted_timestamp] DATETIME NOT NULL,
    [icd_10_updated_timestamp]  DATETIME NOT NULL,
    [icd_status]                SMALLINT NOT NULL
);

