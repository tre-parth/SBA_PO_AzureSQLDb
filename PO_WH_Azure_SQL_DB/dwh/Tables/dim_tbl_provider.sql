CREATE TABLE [dwh].[dim_tbl_provider] (
    [provider_skey]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [provider_npi]             BIGINT        NOT NULL,
    [provider_name]            TEXT          NULL,
    [provider_city]            VARCHAR (100) NULL,
    [provider_address1]        TEXT          NULL,
    [provider_address2]        TEXT          NULL,
    [provider_state]           VARCHAR (100) NULL,
    [provider_zip]             VARCHAR (20)  NULL,
    [provider_speciality_code] VARCHAR (50)  NULL,
    [provider_type]            VARCHAR (50)  NULL,
    [provider_tin]             BIGINT        NULL,
    [run_instance_skey]        BIGINT        NOT NULL,
    [source_file_skey]         BIGINT        NOT NULL,
    [dw_inserted_timestamp]    DATETIME      NOT NULL,
    [dw_updated_timestamp]     DATETIME      NOT NULL
);

