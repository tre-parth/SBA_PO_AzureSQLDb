CREATE TABLE [dbo].[jobservice_job_context_macro] (
    [job_context_id] VARCHAR (255) NOT NULL,
    [macros]         VARCHAR (255) NULL,
    [macros_key]     VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([job_context_id] ASC, [macros_key] ASC),
    CONSTRAINT [FKemuyklxgb5qw46g7mce9jqciu] FOREIGN KEY ([job_context_id]) REFERENCES [dbo].[jobservice_job_context] ([id])
);

