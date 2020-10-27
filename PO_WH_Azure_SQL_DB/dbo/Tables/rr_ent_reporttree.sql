CREATE TABLE [dbo].[rr_ent_reporttree] (
    [id]                 INT           IDENTITY (1, 1) NOT NULL,
    [description]        VARCHAR (255) NULL,
    [name]               VARCHAR (255) NULL,
    [reportType]         INT           NULL,
    [repositoryLocation] VARCHAR (255) NULL,
    [root]               BIT           NOT NULL,
    [parent_id]          INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_81vwxyys0ldbifoxjwc7hukkm] FOREIGN KEY ([parent_id]) REFERENCES [dbo].[rr_ent_reporttree] ([id])
);

