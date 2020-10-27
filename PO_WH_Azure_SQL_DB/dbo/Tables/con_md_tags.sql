CREATE TABLE [dbo].[con_md_tags] (
    [md_id] VARCHAR (255) NOT NULL,
    [name]  VARCHAR (255) NULL,
    CONSTRAINT [FK2cldhsf64jhwx6l4ou3566ksw] FOREIGN KEY ([md_id]) REFERENCES [dbo].[con_md] ([id])
);

