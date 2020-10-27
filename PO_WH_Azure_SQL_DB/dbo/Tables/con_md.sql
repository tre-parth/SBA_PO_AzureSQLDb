CREATE TABLE [dbo].[con_md] (
    [id]          VARCHAR (255)  NOT NULL,
    [description] VARCHAR (4000) NULL,
    [location]    VARCHAR (4000) NOT NULL,
    [name]        VARCHAR (255)  NULL,
    [type]        VARCHAR (255)  NULL,
    [updated_at]  DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_jf0xjh9olmv9vqbj0jfeu8e5v] UNIQUE NONCLUSTERED ([location] ASC)
);

