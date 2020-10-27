CREATE TABLE [dbo].[ra_ent_migration] (
    [migrationStep] VARCHAR (255) NOT NULL,
    [executedAt]    DATETIME      NULL,
    [serverVersion] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([migrationStep] ASC)
);

