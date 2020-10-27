CREATE TABLE [m].[pipeline_details] (
    [stage_skey]           INT           NOT NULL,
    [pipeline_skey]        INT           NOT NULL,
    [pipeline_name]        VARCHAR (100) NOT NULL,
    [file_frequency]       VARCHAR (50)  NOT NULL,
    [source_folder_path]   TEXT          NULL,
    [archive_folder_path]  TEXT          NULL,
    [reject_folder_path]   TEXT          NULL,
    [source_table]         VARCHAR (100) NULL,
    [destination_table]    VARCHAR (100) NOT NULL,
    [pipeline_active_flag] VARCHAR (5)   NOT NULL
);

