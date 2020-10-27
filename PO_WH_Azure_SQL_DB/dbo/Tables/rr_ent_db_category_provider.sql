CREATE TABLE [dbo].[rr_ent_db_category_provider] (
    [id]                    INT           IDENTITY (1, 1) NOT NULL,
    [dbEntryName]           VARCHAR (255) NULL,
    [displayNameColumnName] VARCHAR (255) NULL,
    [identifierColumnName]  VARCHAR (255) NULL,
    [tableName]             VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

