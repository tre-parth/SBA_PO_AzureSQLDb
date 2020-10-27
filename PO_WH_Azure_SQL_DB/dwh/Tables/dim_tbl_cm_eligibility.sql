CREATE TABLE [dwh].[dim_tbl_cm_eligibility] (
    [cm_member_skey]        BIGINT   NOT NULL,
    [member_id]             BIGINT   NULL,
    [member_key]            BIGINT   NULL,
    [member_month_id]       BIGINT   NULL,
    [group_nbr]             BIGINT   NULL,
    [section_nbr]           BIGINT   NULL,
    [subscriber_id]         BIGINT   NULL,
    [contract_type]         TEXT     NULL,
    [product_type]          TEXT     NULL,
    [product_line]          TEXT     NULL,
    [run_instance_skey]     BIGINT   NOT NULL,
    [source_file_skey]      BIGINT   NOT NULL,
    [client_skey]           BIGINT   NOT NULL,
    [carrier_skey]          BIGINT   NOT NULL,
    [dw_inserted_timestamp] DATETIME NOT NULL,
    [dw_updated_timestamp]  DATETIME NOT NULL
);

