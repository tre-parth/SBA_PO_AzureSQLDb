CREATE TABLE [dbo].[shedlock] (
    [name]       VARCHAR (255) NOT NULL,
    [lock_until] DATETIME2 (7) NULL,
    [locked_at]  DATETIME2 (7) NULL,
    [locked_by]  VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([name] ASC)
);

