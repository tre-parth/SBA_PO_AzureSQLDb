CREATE TABLE [dbo].[ra_rel_ldapgroup_group] (
    [ldapName]  VARCHAR (255) NOT NULL,
    [groupName] VARCHAR (255) NOT NULL,
    CONSTRAINT [FK_47xfvus7ybwjabqfgrj5idbg8] FOREIGN KEY ([groupName]) REFERENCES [dbo].[ra_ent_group] ([groupName]),
    CONSTRAINT [FK_58q9rt1fy6ele5ksaihpe032n] FOREIGN KEY ([ldapName]) REFERENCES [dbo].[ra_ent_ldapgroup] ([ldapName])
);

