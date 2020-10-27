CREATE TABLE [dbo].[rr_ent_category] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [displayName] VARCHAR (255) NULL,
    [identifier]  VARCHAR (255) NULL,
    [orderIndex]  INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

