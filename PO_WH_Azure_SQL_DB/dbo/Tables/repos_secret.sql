CREATE TABLE [dbo].[repos_secret] (
    [id]              VARCHAR (255) NOT NULL,
    [value]           VARCHAR (MAX) NULL,
    [repository_name] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKhbiuycq8hk336igdpg8x9658f] FOREIGN KEY ([repository_name]) REFERENCES [dbo].[repos_repo] ([name]),
    CONSTRAINT [UK_rtqjnpxtp7c4gyqey0qxh4u9m] UNIQUE NONCLUSTERED ([repository_name] ASC)
);

