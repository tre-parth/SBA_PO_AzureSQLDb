CREATE TABLE [dbo].[permissions_perm] (
    [id]         VARCHAR (255) NOT NULL,
    [group_name] VARCHAR (255) NULL,
    [privilege]  VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

