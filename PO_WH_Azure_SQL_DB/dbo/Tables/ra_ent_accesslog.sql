CREATE TABLE [dbo].[ra_ent_accesslog] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [callerAddress] VARCHAR (255)  NULL,
    [callerHost]    VARCHAR (255)  NULL,
    [cmmnt]         VARCHAR (1000) NULL,
    [resourceId]    VARCHAR (1000) NULL,
    [status]        INT            NULL,
    [tmstmp]        DATETIME       NULL,
    [restype]       INT            NULL,
    [usr]           VARCHAR (255)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

