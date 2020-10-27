CREATE TABLE [dbo].[jobservice_job_agent] (
    [id]                        VARCHAR (255) NOT NULL,
    [agent_version]             VARCHAR (255) NULL,
    [last_status_at]            DATETIME2 (7) NULL,
    [max_mermory_per_container] BIGINT        NULL,
    [name]                      VARCHAR (255) NULL,
    [number_job_containers]     INT           NULL,
    [queue_name]                VARCHAR (255) NOT NULL,
    [registered_at]             DATETIME2 (7) NULL,
    [rm_core_version]           VARCHAR (255) NULL,
    [state]                     VARCHAR (255) NOT NULL,
    [version]                   DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([max_mermory_per_container]<=(9223372036854775807.)),
    CHECK ([number_job_containers]<=(2147483647))
);

