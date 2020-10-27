CREATE TABLE [dbo].[repos_repo] (
    [name]         VARCHAR (255) NOT NULL,
    [created_at]   DATETIME2 (7) NULL,
    [description]  VARCHAR (MAX) NULL,
    [display_name] VARCHAR (255) NOT NULL,
    [repo_uid]     VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([name] ASC),
    CONSTRAINT [UK_pk98jy7s4fyq33q8fq3ts8fs5] UNIQUE NONCLUSTERED ([repo_uid] ASC)
);

