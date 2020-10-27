CREATE TABLE [dbo].[jobservice_operator_progress] (
    [id]        VARCHAR (255) NOT NULL,
    [duration]  BIGINT        NOT NULL,
    [iteration] INT           NOT NULL,
    [name]      VARCHAR (255) NOT NULL,
    [position]  INT           NOT NULL,
    [progress]  INT           NULL,
    [version]   DATETIME2 (7) NULL,
    [job_id]    VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CHECK ([duration]<=(9223372036854775807.)),
    CHECK ([iteration]<=(2147483647)),
    CHECK ([position]<=(2147483647)),
    CHECK ([progress]<=(2147483647)),
    CONSTRAINT [FK4n2exdnk5skkgxhsb119ydhdd] FOREIGN KEY ([job_id]) REFERENCES [dbo].[jobservice_job] ([id])
);

