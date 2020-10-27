CREATE TABLE [dbo].[ra_ent_configuration] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [name]          VARCHAR (255) NULL,
    [typeId]        VARCHAR (255) NULL,
    [properties_id] INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_tm7i5rllds2egrttp3cbpumej] FOREIGN KEY ([properties_id]) REFERENCES [dbo].[ra_ent_properties] ([id])
);

