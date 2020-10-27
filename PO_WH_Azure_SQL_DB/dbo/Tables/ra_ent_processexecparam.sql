CREATE TABLE [dbo].[ra_ent_processexecparam] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [completed]       BIT           NOT NULL,
    [processContext]  IMAGE         NULL,
    [processLocation] VARCHAR (255) NULL,
    [queueName]       VARCHAR (255) NULL,
    [revision]        INT           NOT NULL,
    [triggerId]       INT           NULL,
    [usrname]         VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

