CREATE TABLE [audit].[audit_run] (
    [run_instance_skey] BIGINT        NOT NULL,
    [run_name]          VARCHAR (100) NOT NULL,
    [File_type]         VARCHAR (50)  NOT NULL,
    [run_status]        VARCHAR (50)  NOT NULL,
    [run_start_time]    DATETIME      NOT NULL,
    [run_end_time]      DATETIME      NULL,
    [run_date]          DATE          NOT NULL,
    [run_description]   TEXT          NULL
);

