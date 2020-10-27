CREATE TABLE [dbo].[ra_ent_user] (
    [userName]  VARCHAR (255) NOT NULL,
    [email]     VARCHAR (255) NULL,
    [origin]    VARCHAR (255) NULL,
    [passwd]    VARCHAR (255) NULL,
    [principal] VARCHAR (255) NULL,
    [realName]  VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([userName] ASC)
);

