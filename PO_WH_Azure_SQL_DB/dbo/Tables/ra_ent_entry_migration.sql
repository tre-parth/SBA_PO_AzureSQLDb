CREATE TABLE [dbo].[ra_ent_entry_migration] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [entryId]          INT           NOT NULL,
    [entryLocation]    VARCHAR (255) NULL,
    [message]          TEXT          NULL,
    [resolutionAction] VARCHAR (255) NULL,
    [result]           VARCHAR (255) NULL,
    [stacktrace]       TEXT          NULL,
    [tmstmp]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

