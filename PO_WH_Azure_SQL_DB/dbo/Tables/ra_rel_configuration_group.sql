CREATE TABLE [dbo].[ra_rel_configuration_group] (
    [ra_ent_configuration_id]   INT           NOT NULL,
    [permittedGroups_groupName] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([ra_ent_configuration_id] ASC, [permittedGroups_groupName] ASC),
    CONSTRAINT [FK_kb5nks8q95m6qji0nhq08iora] FOREIGN KEY ([permittedGroups_groupName]) REFERENCES [dbo].[ra_ent_group] ([groupName]),
    CONSTRAINT [FK_wq21b5sjpo3r7cs0r8d7wutu] FOREIGN KEY ([ra_ent_configuration_id]) REFERENCES [dbo].[ra_ent_configuration] ([id])
);

