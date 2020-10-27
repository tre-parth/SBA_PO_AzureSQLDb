CREATE TABLE [dbo].[jobservice_job] (
    [id]             VARCHAR (255) NOT NULL,
    [created_at]     DATETIME2 (7) NULL,
    [dequeued_at]    DATETIME2 (7) NULL,
    [duration]       BIGINT        NULL,
    [ended_at]       DATETIME2 (7) NULL,
    [jc_name]        VARCHAR (255) NULL,
    [last_status_at] DATETIME2 (7) NULL,
    [location]       VARCHAR (255) NULL,
    [max_memory]     BIGINT        NULL,
    [max_ttl]        BIGINT        NULL,
    [owner_id]       VARCHAR (255) NOT NULL,
    [process]        VARCHAR (MAX) NOT NULL,
    [queue_name]     VARCHAR (255) NOT NULL,
    [report_error]   INT           NULL,
    [started_at]     DATETIME2 (7) NULL,
    [state]          VARCHAR (255) NOT NULL,
    [stop_requested] INT           NULL,
    [used_memory]    BIGINT        NULL,
    [version]        DATETIME2 (7) NULL,
    [context_id]     VARCHAR (255) NULL,
    [job_agent_id]   VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([duration]<=(9223372036854775807.)),
    CHECK ([max_memory]<=(9223372036854775807.)),
    CHECK ([max_ttl]<=(9223372036854775807.)),
    CHECK ([used_memory]<=(9223372036854775807.)),
    CONSTRAINT [FKaxk74e6dwnq3o05opjeacidwf] FOREIGN KEY ([job_agent_id]) REFERENCES [dbo].[jobservice_job_agent] ([id]),
    CONSTRAINT [FKp1ssetc9pgkuafvwju0l82h6p] FOREIGN KEY ([context_id]) REFERENCES [dbo].[jobservice_job_context] ([id])
);


GO
CREATE NONCLUSTERED INDEX [IDX_QUEUE_X_STATE]
    ON [dbo].[jobservice_job]([queue_name] ASC, [state] ASC);

