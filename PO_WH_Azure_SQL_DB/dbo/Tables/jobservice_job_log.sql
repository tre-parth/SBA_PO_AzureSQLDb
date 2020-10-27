CREATE TABLE [dbo].[jobservice_job_log] (
    [id]           VARCHAR (255) NOT NULL,
    [log]          VARCHAR (MAX) NULL,
    [received_at]  DATETIME2 (7) NULL,
    [requested_at] DATETIME2 (7) NOT NULL,
    [total_lines]  INT           NULL,
    [truncated]    INT           NULL,
    [job_id]       VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([total_lines]<=(2147483647)),
    CONSTRAINT [FKhohtd1dunfdhiu9qc57kwkdn2] FOREIGN KEY ([job_id]) REFERENCES [dbo].[jobservice_job] ([id]),
    CONSTRAINT [UK_e9888o8k5rvggcyf1m4vakowe] UNIQUE NONCLUSTERED ([job_id] ASC)
);

