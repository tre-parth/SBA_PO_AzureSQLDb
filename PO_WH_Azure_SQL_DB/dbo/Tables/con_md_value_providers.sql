CREATE TABLE [dbo].[con_md_value_providers] (
    [id]    VARCHAR (255) NOT NULL,
    [name]  VARCHAR (255) NOT NULL,
    [type]  VARCHAR (255) NOT NULL,
    [md_id] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKrd51toeqpt1d9ifo5xe6nnt50] FOREIGN KEY ([md_id]) REFERENCES [dbo].[con_md] ([id])
);

