CREATE TABLE [dbo].[ra_rel_group_ldapgroup] (
    [groupName] VARCHAR (255) NOT NULL,
    [ldapName]  VARCHAR (255) NOT NULL,
    CONSTRAINT [FK_gidgkiedww1jc9qqsl7956824] FOREIGN KEY ([groupName]) REFERENCES [dbo].[ra_ent_group] ([groupName]),
    CONSTRAINT [FK_pus9byltjd9efejt89u2sw08r] FOREIGN KEY ([ldapName]) REFERENCES [dbo].[ra_ent_ldapgroup] ([ldapName])
);

