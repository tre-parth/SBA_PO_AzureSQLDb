﻿CREATE TABLE [stg].[tbl_client_program_info] (
    [client_skey]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [client_id]                    BIGINT        NOT NULL,
    [client_name]                  VARCHAR (100) NOT NULL,
    [account_executive]            VARCHAR (100) NULL,
    [program_start_year]           DATE          NULL,
    [termed_date]                  DATE          NULL,
    [sds_claims_analysis_due_date] DATE          NULL,
    [data_channel]                 VARCHAR (100) NULL,
    [approved_communication_date]  DATE          NULL,
    [po_active]                    VARCHAR (5)   NOT NULL,
    [sds_hip]                      VARCHAR (1)   NULL,
    [sds_knee]                     VARCHAR (1)   NULL,
    [sds_lbp]                      VARCHAR (1)   NULL,
    [sds_uf]                       VARCHAR (1)   NULL,
    [sds_wls]                      VARCHAR (1)   NULL,
    [sds_claims_analysis]          VARCHAR (1)   NULL,
    [bh]                           VARCHAR (1)   NULL,
    [cad]                          VARCHAR (1)   NULL,
    [cqp]                          VARCHAR (1)   NULL,
    [run_instance_skey]            BIGINT        NOT NULL,
    [source_file_skey]             BIGINT        NOT NULL,
    [stg_inserted_timestamp]       DATETIME      NOT NULL
);

