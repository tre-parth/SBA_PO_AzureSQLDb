CREATE TABLE [dbo].[ra_ent_confirmable_action] (
    [code]          VARCHAR (255) NOT NULL,
    [creationDate]  DATETIME      NULL,
    [type]          INT           NULL,
    [user_userName] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([code] ASC),
    CONSTRAINT [FK_6stmgut8krndwjkslpdnsi77m] FOREIGN KEY ([user_userName]) REFERENCES [dbo].[ra_ent_user] ([userName])
);

