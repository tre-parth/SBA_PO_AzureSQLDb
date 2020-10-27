CREATE TABLE [dbo].[con_md_keys] (
    [id]        VARCHAR (255) NOT NULL,
    [key_group] VARCHAR (255) NOT NULL,
    [ordering]  BIGINT        NULL,
    [md_id]     VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKd3pcssqg2qvy2ve5j9hh1xbdp] FOREIGN KEY ([md_id]) REFERENCES [dbo].[con_md] ([id])
);

