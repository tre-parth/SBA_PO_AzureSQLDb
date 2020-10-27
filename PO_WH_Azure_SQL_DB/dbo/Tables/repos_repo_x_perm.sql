CREATE TABLE [dbo].[repos_repo_x_perm] (
    [repo_name] VARCHAR (255) NOT NULL,
    [perm_id]   VARCHAR (255) NOT NULL,
    CONSTRAINT [FK5cap9plieuwlwiqhxmyf2qlif] FOREIGN KEY ([repo_name]) REFERENCES [dbo].[repos_repo] ([name]),
    CONSTRAINT [FKsy8n28rm05chbth6uwxnf3cyl] FOREIGN KEY ([perm_id]) REFERENCES [dbo].[permissions_perm] ([id]),
    CONSTRAINT [UK_hfwr0g0i9xj7b2ir7r3nkv8na] UNIQUE NONCLUSTERED ([perm_id] ASC)
);

