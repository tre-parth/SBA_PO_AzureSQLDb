CREATE TABLE [dwh].[dim_tbl_integrated_id] (
    [integrated_member_skey] BIGINT        NOT NULL,
    [carrier_skey]           BIGINT        NOT NULL,
    [client_skey]            BIGINT        NOT NULL,
    [salesforce_skey]        BIGINT        NOT NULL,
    [medical_carrier_skey]   BIGINT        NOT NULL,
    [pharmacy_carrier_skey]  BIGINT        NOT NULL,
    [effective_date]         DATETIME      NOT NULL,
    [end_date]               DATETIME      NULL,
    [first_name]             VARCHAR (100) NOT NULL,
    [last_name]              VARCHAR (100) NOT NULL,
    [dob]                    DATE          NOT NULL,
    [gender]                 VARCHAR (5)   NOT NULL,
    [employee_id]            BIGINT        NOT NULL,
    [run_instance_skey]      BIGINT        NOT NULL,
    [dw_inserted_timestamp]  DATETIME      NOT NULL,
    [dw_updated_timestamp]   DATETIME      NOT NULL
);

