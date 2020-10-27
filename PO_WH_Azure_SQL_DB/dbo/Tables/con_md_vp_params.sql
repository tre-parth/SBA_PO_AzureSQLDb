CREATE TABLE [dbo].[con_md_vp_params] (
    [id]        VARCHAR (255)  NOT NULL,
    [enabled]   INT            NULL,
    [encrypted] INT            NULL,
    [name]      VARCHAR (255)  NOT NULL,
    [ordering]  BIGINT         NULL,
    [value]     VARCHAR (4000) NULL,
    [vp_id]     VARCHAR (255)  NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKgwf0s5y9mbp3h3c57tjst8qop] FOREIGN KEY ([vp_id]) REFERENCES [dbo].[con_md_value_providers] ([id])
);

