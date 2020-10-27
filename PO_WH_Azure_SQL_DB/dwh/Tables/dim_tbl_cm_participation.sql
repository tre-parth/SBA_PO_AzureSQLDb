CREATE TABLE [dwh].[dim_tbl_cm_participation] (
    [salesforce_skey]       BIGINT   NOT NULL,
    [salesforce_id]         BIGINT   NOT NULL,
    [attribute_1]           TEXT     NULL,
    [attribute_2]           TEXT     NULL,
    [attribute_3]           TEXT     NULL,
    [run_instance_skey]     BIGINT   NOT NULL,
    [source_file_skey]      BIGINT   NOT NULL,
    [client_skey]           BIGINT   NOT NULL,
    [carrier_skey]          BIGINT   NOT NULL,
    [dw_inserted_timestamp] DATETIME NOT NULL,
    [dw_updated_timestamp]  DATETIME NOT NULL
);

