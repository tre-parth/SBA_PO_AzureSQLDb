CREATE TABLE [dbo].[rr_rel_realm_domain] (
    [rr_ent_realm_id] INT NOT NULL,
    [domains_id]      INT NOT NULL,
    CONSTRAINT [FK_i3gyl1a68r9sdrsxhw29ytpf1] FOREIGN KEY ([rr_ent_realm_id]) REFERENCES [dbo].[rr_ent_realm] ([id]),
    CONSTRAINT [FK_jpjqcob2x5566lgxwi6pm0mm7] FOREIGN KEY ([domains_id]) REFERENCES [dbo].[rr_ent_domain] ([id]),
    CONSTRAINT [UK_jpjqcob2x5566lgxwi6pm0mm7] UNIQUE NONCLUSTERED ([domains_id] ASC)
);

