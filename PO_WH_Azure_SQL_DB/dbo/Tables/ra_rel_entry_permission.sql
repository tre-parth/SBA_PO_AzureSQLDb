CREATE TABLE [dbo].[ra_rel_entry_permission] (
    [entryLocation] INT NOT NULL,
    [perm]          INT NOT NULL,
    CONSTRAINT [FK_451wkfvfcg7r9i8rw8hhd054v] FOREIGN KEY ([perm]) REFERENCES [dbo].[ra_ent_permission] ([id]),
    CONSTRAINT [FK_bki7cgvo976xmyiuk0x5h5qxw] FOREIGN KEY ([entryLocation]) REFERENCES [dbo].[ra_ent_entry] ([id]),
    CONSTRAINT [UK_451wkfvfcg7r9i8rw8hhd054v] UNIQUE NONCLUSTERED ([perm] ASC)
);

