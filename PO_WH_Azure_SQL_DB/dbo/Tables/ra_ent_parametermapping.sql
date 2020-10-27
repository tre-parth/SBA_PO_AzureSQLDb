CREATE TABLE [dbo].[ra_ent_parametermapping] (
    [DTYPE]          VARCHAR (31)  NOT NULL,
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [mandatory]      BIT           NOT NULL,
    [queryParameter] VARCHAR (255) NULL,
    [macroKey]       VARCHAR (255) NULL,
    [operatorName]   VARCHAR (255) NULL,
    [parameterName]  VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

