CREATE TABLE [dbo].[jobservice_job_error] (
    [id]          VARCHAR (255) NOT NULL,
    [explanation] VARCHAR (MAX) NULL,
    [message]     VARCHAR (MAX) NOT NULL,
    [title]       VARCHAR (255) NULL,
    [trace]       VARCHAR (MAX) NULL,
    [type]        VARCHAR (255) NOT NULL,
    [job_id]      VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKqdax2mvai2kmgoi0attpphote] FOREIGN KEY ([job_id]) REFERENCES [dbo].[jobservice_job] ([id]),
    CONSTRAINT [UK_9c20tdr8pmurluy2iu564i942] UNIQUE NONCLUSTERED ([job_id] ASC)
);

