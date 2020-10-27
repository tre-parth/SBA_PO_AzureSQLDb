CREATE TABLE [stg].[tbl_ndc] (
    [ndc_skey]               BIGINT      IDENTITY (1, 1) NOT NULL,
    [product_ndc]            BIGINT      NOT NULL,
    [ndc_package_code]       BIGINT      NOT NULL,
    [product_id]             TEXT        NOT NULL,
    [package_description]    TEXT        NOT NULL,
    [start_marketing_date]   DATE        NOT NULL,
    [end_marketing_date]     DATE        NOT NULL,
    [ndc_exclude_flag]       VARCHAR (1) NOT NULL,
    [sample_package]         VARCHAR (1) NOT NULL,
    [product_type_name]      TEXT        NOT NULL,
    [proprietary_name]       TEXT        NOT NULL,
    [non_proprietary_name]   TEXT        NOT NULL,
    [dosage_form_name]       TEXT        NOT NULL,
    [route_name]             TEXT        NOT NULL,
    [run_instance_skey]      BIGINT      NOT NULL,
    [source_file_skey]       BIGINT      NOT NULL,
    [stg_inserted_timestamp] DATETIME    NOT NULL
);

