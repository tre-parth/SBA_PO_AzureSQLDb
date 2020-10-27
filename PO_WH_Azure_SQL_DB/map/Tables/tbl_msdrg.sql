CREATE TABLE [map].[tbl_msdrg] (
    [msdrg_skey]               BIGINT       IDENTITY (1, 1) NOT NULL,
    [ms_drg]                   BIGINT       NOT NULL,
    [mdc]                      VARCHAR (10) NOT NULL,
    [Type]                     VARCHAR (10) NOT NULL,
    [ms_drg_title]             TEXT         NOT NULL,
    [run_instance_skey]        BIGINT       NULL,
    [source_file_skey]         BIGINT       NULL,
    [msdrg_inserted_timestamp] DATETIME     NOT NULL,
    [msdrg_updated_timestamp]  DATETIME     NOT NULL,
    [msdrg_status]             TEXT         NOT NULL
);

