CREATE TABLE [dbo].[con_vault_entries] (
    [id]          VARCHAR (255)  NOT NULL,
    [owner]       VARCHAR (255)  NOT NULL,
    [updated_at]  DATETIME2 (7)  NULL,
    [vault_value] VARCHAR (4000) NULL,
    [param_id]    VARCHAR (255)  NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FKmtt59qq3dhf3jghttipygji1y] FOREIGN KEY ([param_id]) REFERENCES [dbo].[con_md_params] ([id])
);

