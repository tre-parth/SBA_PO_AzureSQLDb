CREATE TABLE [dbo].[ra_ent_trigger] (
    [DTYPE]               VARCHAR (31)  NOT NULL,
    [id]                  INT           IDENTITY (1, 1) NOT NULL,
    [active]              BIT           NOT NULL,
    [deactivateOnFailure] BIT           NOT NULL,
    [lastMessage]         VARCHAR (255) NULL,
    [lastTriggerDate]     DATETIME      NULL,
    [process]             VARCHAR (255) NULL,
    [queue]               VARCHAR (255) NULL,
    [usr]                 VARCHAR (255) NULL,
    [batchMode]           BIT           NULL,
    [filename]            VARCHAR (255) NULL,
    [lastUpdate]          DATETIME      NULL,
    [folderName]          VARCHAR (255) NULL,
    [jndiName]            VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

