CREATE TABLE [dbo].[jobservice_queue_purge] (
    [queue_name]     VARCHAR (255) NOT NULL,
    [last_status_at] DATETIME2 (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([queue_name] ASC)
);

