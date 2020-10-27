CREATE TABLE [dbo].[con_md_errors] (
    [id]         VARCHAR (255)  NOT NULL,
    [location]   VARCHAR (4000) NOT NULL,
    [updated_at] DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

