CREATE TABLE [dbo].[ra_ent_exportedprocess] (
    [serviceId]                  VARCHAR (255) NOT NULL,
    [XSLTEntry]                  VARCHAR (255) NULL,
    [inputCached]                BIT           NOT NULL,
    [mimeType]                   VARCHAR (255) NULL,
    [outputFormat]               INT           NULL,
    [processEntry]               VARCHAR (255) NULL,
    [additionalPropertiesMap_id] INT           NULL,
    [dsInputPropertiesMap_id]    INT           NULL,
    PRIMARY KEY CLUSTERED ([serviceId] ASC),
    CONSTRAINT [FK_54ynwbifnelm6by65r9eargep] FOREIGN KEY ([dsInputPropertiesMap_id]) REFERENCES [dbo].[ra_ent_properties] ([id]),
    CONSTRAINT [FK_bdd9x403w8jtxfeqg9qs82ls5] FOREIGN KEY ([additionalPropertiesMap_id]) REFERENCES [dbo].[ra_ent_properties] ([id])
);

