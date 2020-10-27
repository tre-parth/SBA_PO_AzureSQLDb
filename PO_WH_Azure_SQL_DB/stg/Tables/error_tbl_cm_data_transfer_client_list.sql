CREATE TABLE [stg].[error_tbl_cm_data_transfer_client_list] (
    [client_id]              INT          NOT NULL,
    [client_name]            TEXT         NULL,
    [channel]                VARCHAR (50) NULL,
    [carrier]                VARCHAR (50) NULL,
    [data_source]            VARCHAR (50) NULL,
    [file_type]              VARCHAR (30) NULL,
    [file_name]              TEXT         NULL,
    [layout_file_path]       TEXT         NULL,
    [input_file_path]        TEXT         NULL,
    [po_active]              VARCHAR (5)  NULL,
    [aggregate_file]         VARCHAR (5)  NULL,
    [run_instance_skey]      BIGINT       NOT NULL,
    [source_file_skey]       BIGINT       NOT NULL,
    [stg_inserted_timestamp] DATETIME     NOT NULL
);

