CREATE TABLE [m].[file_details] (
    [source_file_skey]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [run_instance_skey] BIGINT        NOT NULL,
    [source_file_path]  TEXT          NOT NULL,
    [archive_file_path] TEXT          NULL,
    [reject_file_path]  TEXT          NULL,
    [Flag]              VARCHAR (10)  NULL,
    [carrier_name]      VARCHAR (100) NOT NULL,
    [client_name]       VARCHAR (100) NOT NULL,
    [year]              INT           NOT NULL,
    [month]             INT           NOT NULL,
    [load_time]         DATETIME      NOT NULL
);

