CREATE TABLE [dbo].[ra_ent_permission] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [executionAllowed] VARCHAR (255) NULL,
    [readingAllowed]   VARCHAR (255) NULL,
    [writingAllowed]   VARCHAR (255) NULL,
    [group_groupName]  VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_8nhv7r2lyglri5s0nqr4tgp2l] FOREIGN KEY ([group_groupName]) REFERENCES [dbo].[ra_ent_group] ([groupName])
);

