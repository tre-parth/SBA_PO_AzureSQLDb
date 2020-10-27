CREATE TABLE [land].[tbl_ndc_codes] (
    [seq_key]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [product_ndc]          VARCHAR (100)  NULL,
    [ndc_package_code]     VARCHAR (100)  NULL,
    [product_id]           VARCHAR (100)  NULL,
    [package_description]  VARCHAR (1000) NULL,
    [start_marketing_date] VARCHAR (10)   NULL,
    [end_marketing_date]   VARCHAR (10)   NULL,
    [ndc_exclude_flag]     VARCHAR (10)   NULL,
    [sample_package]       VARCHAR (10)   NULL,
    [product_type_name]    VARCHAR (100)  NULL,
    [proprietary_name]     VARCHAR (500)  NULL,
    [non_proprietary_name] VARCHAR (1000) NULL,
    [dosage_form_name]     VARCHAR (100)  NULL,
    [route_name]           VARCHAR (500)  NULL
);

