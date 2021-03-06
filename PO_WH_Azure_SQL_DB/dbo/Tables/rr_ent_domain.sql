﻿CREATE TABLE [dbo].[rr_ent_domain] (
    [DTYPE]                  VARCHAR (31)  NOT NULL,
    [id]                     INT           IDENTITY (1, 1) NOT NULL,
    [description]            VARCHAR (255) NULL,
    [name]                   VARCHAR (255) NULL,
    [dynamic]                BIT           NULL,
    [defaultNumber]          FLOAT (53)    NULL,
    [is_integer]             BIT           NULL,
    [maximum]                FLOAT (53)    NULL,
    [minimum]                FLOAT (53)    NULL,
    [defaultText]            VARCHAR (255) NULL,
    [defaultComputationMode] INT           NULL,
    [defaultDate]            DATETIME      NULL,
    [defaultOffset]          INT           NULL,
    [earliest]               DATETIME      NULL,
    [earliestIsNow]          BIT           NULL,
    [encodingMethod]         INT           NULL,
    [latest]                 DATETIME      NULL,
    [latestIsNow]            BIT           NULL,
    [offsetUnit]             INT           NULL,
    [roundDefaultOff]        BIT           NULL,
    [defaultBoolean]         BIT           NULL,
    [dbCategoryProvider_id]  INT           NULL,
    [defaultCategory_id]     INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_hr9w1uwg11kurdbe8d34a0p78] FOREIGN KEY ([dbCategoryProvider_id]) REFERENCES [dbo].[rr_ent_db_category_provider] ([id]),
    CONSTRAINT [FK_s4j7kw71tyfu9ddbpy2ni5ty] FOREIGN KEY ([defaultCategory_id]) REFERENCES [dbo].[rr_ent_category] ([id])
);

