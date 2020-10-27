CREATE TABLE [dbo].[sync_files] (
    [id]              VARCHAR (255) NOT NULL,
    [created_at]      DATETIME2 (7) NULL,
    [location]        VARCHAR (MAX) NOT NULL,
    [name]            VARCHAR (255) NOT NULL,
    [file_size]       BIGINT        NULL,
    [manageable_type] VARCHAR (255) NOT NULL,
    [unzip]           INT           NULL,
    [updated_at]      DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UKkdiuk5aauooryng6qwl3nfmmj] UNIQUE NONCLUSTERED ([name] ASC, [manageable_type] ASC)
);

