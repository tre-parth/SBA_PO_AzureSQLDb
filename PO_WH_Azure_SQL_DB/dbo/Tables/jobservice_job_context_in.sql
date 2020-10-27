CREATE TABLE [dbo].[jobservice_job_context_in] (
    [job_context_id]  VARCHAR (255) NOT NULL,
    [input_locations] VARCHAR (255) NULL,
    CONSTRAINT [FK3y3kor85wnl9khet9jpr661hw] FOREIGN KEY ([job_context_id]) REFERENCES [dbo].[jobservice_job_context] ([id])
);

