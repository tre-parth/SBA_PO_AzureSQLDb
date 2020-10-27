CREATE TABLE [dbo].[ra_ent_entry] (
    [DTYPE]        VARCHAR (31)  NOT NULL,
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [creationDate] DATETIME      NULL,
    [name]         VARCHAR (255) NULL,
    [owner]        VARCHAR (255) NULL,
    [container_id] INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_816rvbq892pxplklx2bjim5cm] FOREIGN KEY ([container_id]) REFERENCES [dbo].[ra_ent_entry] ([id])
);

