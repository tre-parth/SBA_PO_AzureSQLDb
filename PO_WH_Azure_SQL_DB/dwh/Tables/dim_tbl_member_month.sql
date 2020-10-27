CREATE TABLE [dwh].[dim_tbl_member_month] (
    [member_month_skey]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [integrated_member_skey] BIGINT       NOT NULL,
    [carrier_skey]           BIGINT       NOT NULL,
    [client_skey]            BIGINT       NOT NULL,
    [coverage_type]          VARCHAR (50) NOT NULL,
    [yr_month]               VARCHAR (10) NOT NULL,
    [member_month_count]     INT          NOT NULL,
    [run_instance_skey]      BIGINT       NOT NULL,
    [dw_inserted_timestamp]  DATETIME     NOT NULL,
    [dw_updated_timestamp]   DATETIME     NOT NULL
);

