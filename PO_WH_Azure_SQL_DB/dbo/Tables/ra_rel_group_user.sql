CREATE TABLE [dbo].[ra_rel_group_user] (
    [groupName] VARCHAR (255) NOT NULL,
    [userName]  VARCHAR (255) NOT NULL,
    CONSTRAINT [FK_e6ridr9dj2mr16ri3969hvjjx] FOREIGN KEY ([groupName]) REFERENCES [dbo].[ra_ent_group] ([groupName]),
    CONSTRAINT [FK_t1ljc8fmv4uvxlkrvs682ixr] FOREIGN KEY ([userName]) REFERENCES [dbo].[ra_ent_user] ([userName])
);

