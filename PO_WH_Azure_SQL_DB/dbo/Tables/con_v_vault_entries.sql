CREATE TABLE [dbo].[con_v_vault_entries] (
    [id]              VARCHAR (255)  NOT NULL,
    [parameter_group] VARCHAR (255)  NOT NULL,
    [location]        VARCHAR (4000) NOT NULL,
    [owner]           VARCHAR (255)  NOT NULL,
    [parameter_name]  VARCHAR (255)  NOT NULL,
    [updated_at]      DATETIME2 (7)  NULL,
    [vault_value]     VARCHAR (4000) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

