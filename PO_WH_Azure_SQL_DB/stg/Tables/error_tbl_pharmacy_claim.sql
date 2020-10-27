CREATE TABLE [stg].[error_tbl_pharmacy_claim] (
    [rx_id]                       BIGINT        NOT NULL,
    [rx_national_drug_code]       VARCHAR (20)  NULL,
    [rx_drug_name]                VARCHAR (100) NOT NULL,
    [rx_drug_type_code]           CHAR (1)      NOT NULL,
    [rx_drug_category_code]       VARCHAR (5)   NOT NULL,
    [rx_tier_level_code]          VARCHAR (5)   NOT NULL,
    [rx_therapeutic_class]        VARCHAR (10)  NULL,
    [rx_dea_number]               BIGINT        NULL,
    [rx_mail_order_indicator]     CHAR (1)      NOT NULL,
    [rx_dispense_as_written]      TEXT          NOT NULL,
    [rx_metric_qty]               BIGINT        NOT NULL,
    [rx_days_supply]              INT           NOT NULL,
    [rx_origin_code]              CHAR (1)      NOT NULL,
    [rx_gpi]                      VARCHAR (100) NULL,
    [rx_generic_paid_indicator]   CHAR (1)      NOT NULL,
    [rx_chain_pharmacy_id]        BIGINT        NULL,
    [rx_formulary_drug_indicator] CHAR (1)      NULL,
    [rx_compound_code]            CHAR (1)      NOT NULL,
    [run_instance_skey]           BIGINT        NOT NULL,
    [source_file_skey]            BIGINT        NOT NULL,
    [stg_inserted_timestamp]      DATETIME      NOT NULL
);

