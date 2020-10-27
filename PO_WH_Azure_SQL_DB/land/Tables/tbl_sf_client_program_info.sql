CREATE TABLE [land].[tbl_sf_client_program_info] (
    [client_id]                    VARCHAR (MAX) NOT NULL,
    [client_name]                  VARCHAR (MAX) NOT NULL,
    [account_executive]            VARCHAR (MAX) NULL,
    [program_start_year]           VARCHAR (MAX) NULL,
    [termed_date]                  VARCHAR (MAX) NULL,
    [sds_claims_analysis_due_date] VARCHAR (MAX) NULL,
    [data_channel]                 VARCHAR (MAX) NULL,
    [approved_communication_date]  VARCHAR (MAX) NULL,
    [po_active]                    VARCHAR (MAX) NOT NULL,
    [sds_hip]                      VARCHAR (MAX) NULL,
    [sds_knee]                     VARCHAR (MAX) NULL,
    [sds_lbp]                      VARCHAR (MAX) NULL,
    [sds_uf]                       VARCHAR (MAX) NULL,
    [sds_wls]                      VARCHAR (MAX) NULL,
    [sds_claims_analysis]          VARCHAR (MAX) NULL,
    [bh]                           VARCHAR (MAX) NULL,
    [cad]                          VARCHAR (MAX) NULL,
    [cqp]                          VARCHAR (MAX) NULL,
    [run_instance_skey]            VARCHAR (MAX) NOT NULL,
    [source_file_skey]             VARCHAR (MAX) NOT NULL
);

