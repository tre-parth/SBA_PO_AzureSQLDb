CREATE TABLE [dbo].[ra_rel_dbconentry_group] (
    [ra_ent_dbconnectionentry_id] INT           NOT NULL,
    [permittedGroups_groupName]   VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([ra_ent_dbconnectionentry_id] ASC, [permittedGroups_groupName] ASC),
    CONSTRAINT [FK_1ddralpqbwas5r38ifeext41v] FOREIGN KEY ([permittedGroups_groupName]) REFERENCES [dbo].[ra_ent_group] ([groupName]),
    CONSTRAINT [FK_iktkoyvvv6ln6n99lqb9hoo06] FOREIGN KEY ([ra_ent_dbconnectionentry_id]) REFERENCES [dbo].[ra_ent_dbconnectionentry] ([id])
);

