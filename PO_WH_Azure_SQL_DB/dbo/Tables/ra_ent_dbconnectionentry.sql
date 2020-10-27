CREATE TABLE [dbo].[ra_ent_dbconnectionentry] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [databaseSchema]   VARCHAR (255) NULL,
    [host]             VARCHAR (255) NULL,
    [name]             VARCHAR (255) NULL,
    [passwd]           VARCHAR (255) NULL,
    [port]             VARCHAR (255) NULL,
    [databaseSystem]   VARCHAR (255) NULL,
    [usrname]          VARCHAR (255) NULL,
    [propertiesMap_id] INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_51tyx6t7rbmbck7bj41pgr1w0] FOREIGN KEY ([propertiesMap_id]) REFERENCES [dbo].[ra_ent_properties] ([id]),
    CONSTRAINT [UK_jmk1tvn3xvxxwvcw8mj1v3yu8] UNIQUE NONCLUSTERED ([name] ASC)
);

