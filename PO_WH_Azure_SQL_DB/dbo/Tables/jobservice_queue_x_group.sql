CREATE TABLE [dbo].[jobservice_queue_x_group] (
    [queue_name] VARCHAR (255) NOT NULL,
    [group_name] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([queue_name] ASC, [group_name] ASC),
    CONSTRAINT [FK8fql5bb2r5r6yianv0ho5xxft] FOREIGN KEY ([group_name]) REFERENCES [dbo].[jobservice_group] ([name]),
    CONSTRAINT [FKloc7nnh3ephw03kt2m8wi6pp2] FOREIGN KEY ([queue_name]) REFERENCES [dbo].[jobservice_queue] ([name])
);

