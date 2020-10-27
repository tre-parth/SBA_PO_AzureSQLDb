CREATE TABLE [dbo].[ra_ent_jobsubmissionfailure] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [message]         TEXT          NULL,
    [process]         TEXT          NULL,
    [processLocation] VARCHAR (255) NULL,
    [queue]           VARCHAR (255) NULL,
    [time]            DATETIME      NULL,
    [username]        VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [JobSubmissionFailure_user_index]
    ON [dbo].[ra_ent_jobsubmissionfailure]([username] ASC);

