CREATE TABLE [dbo].[ra_ent_property] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [name]      VARCHAR (255)  NULL,
    [value]     VARCHAR (4000) NULL,
    [parent_id] INT            NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_owbprvsofdaa4dnn9ye084na2] FOREIGN KEY ([parent_id]) REFERENCES [dbo].[ra_ent_properties] ([id])
);

