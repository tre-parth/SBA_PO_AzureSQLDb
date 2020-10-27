CREATE TABLE [dbo].[ra_rel_user_group] (
    [userName]  VARCHAR (255) NOT NULL,
    [groupName] VARCHAR (255) NOT NULL,
    CONSTRAINT [FK_io9l744nr09bkt92vku4k9mdd] FOREIGN KEY ([userName]) REFERENCES [dbo].[ra_ent_user] ([userName]),
    CONSTRAINT [FK_r1699qsprpnessx99imqmw4j4] FOREIGN KEY ([groupName]) REFERENCES [dbo].[ra_ent_group] ([groupName])
);

