CREATE TABLE [map].[tbl_revenue_codes] (
    [revenue_code_skey]      BIGINT   IDENTITY (1, 1) NOT NULL,
    [rev_code]               INT      NOT NULL,
    [description]            TEXT     NOT NULL,
    [run_instance_skey]      BIGINT   NULL,
    [source_file_skey]       BIGINT   NULL,
    [rec_inserted_timestamp] DATETIME NOT NULL,
    [rec_updated_timestamp]  DATETIME NOT NULL,
    [rec_status]             SMALLINT DEFAULT ((1)) NOT NULL
);

