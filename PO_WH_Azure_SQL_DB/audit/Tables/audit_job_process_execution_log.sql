﻿CREATE TABLE [audit].[audit_job_process_execution_log] (
    [S.No.]                 INT           IDENTITY (1, 1) NOT NULL,
    [run_instance_skey]     BIGINT        NOT NULL,
    [stage_skey]            INT           NOT NULL,
    [pipeline_skey]         INT           NOT NULL,
    [process_type]          VARCHAR (100) NULL,
    [process_name]          TEXT          NULL,
    [source_name]           VARCHAR (200) NOT NULL,
    [destination_name]      TEXT          NULL,
    [source_row_count]      BIGINT        NULL,
    [destination_row_count] BIGINT        NULL,
    [rejection_count]       BIGINT        NULL,
    [duplicate_count]       BIGINT        NULL,
    [insert_count]          BIGINT        NULL,
    [update_count]          BIGINT        NULL,
    [delete_count]          BIGINT        NULL,
    [file_processed_flag]   VARCHAR (5)   NULL,
    [load_status]           VARCHAR (50)  NULL,
    [message]               TEXT          NULL,
    [load_start_time]       DATETIME      NOT NULL,
    [load_end_time]         DATETIME      NULL,
    [Date_Inserted]         DATETIME      CONSTRAINT [DF_audit_job_process_execution_log_Date_Inserted] DEFAULT (getdate()) NULL,
    [Date_Updated]          DATETIME      CONSTRAINT [DF_audit_job_process_execution_log_Date_Updated] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_audit_job_process_execution_log_1] PRIMARY KEY CLUSTERED ([S.No.] ASC)
);

