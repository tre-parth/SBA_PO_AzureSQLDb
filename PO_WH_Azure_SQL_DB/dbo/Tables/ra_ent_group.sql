CREATE TABLE [dbo].[ra_ent_group] (
    [groupName]        VARCHAR (255) NOT NULL,
    [assignToNewUsers] BIT           NOT NULL,
    [description]      VARCHAR (255) NULL,
    [mirror]           BIT           NULL,
    [singleton]        BIT           NOT NULL,
    [special]          BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([groupName] ASC)
);

