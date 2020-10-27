CREATE TABLE [dbo].[jobservice_job_context_out] (
    [job_context_id]   VARCHAR (255) NOT NULL,
    [output_locations] VARCHAR (255) NULL,
    CONSTRAINT [FK6ciiexkwfynocs08pigi7akhk] FOREIGN KEY ([job_context_id]) REFERENCES [dbo].[jobservice_job_context] ([id])
);

