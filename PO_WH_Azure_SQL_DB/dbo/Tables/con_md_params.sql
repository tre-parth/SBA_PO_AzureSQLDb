CREATE TABLE [dbo].[con_md_params] (
    [id]            VARCHAR (255)  NOT NULL,
    [enabled]       INT            NULL,
    [encrypted]     INT            NULL,
    [injectable]    INT            NULL,
    [injector_name] VARCHAR (255)  NULL,
    [name]          VARCHAR (255)  NOT NULL,
    [ordering]      BIGINT         NULL,
    [value]         VARCHAR (4000) NULL,
    [md_key_id]     VARCHAR (255)  NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKaklsboxotxqnvp5n3il0iaq6k] FOREIGN KEY ([md_key_id]) REFERENCES [dbo].[con_md_keys] ([id])
);

