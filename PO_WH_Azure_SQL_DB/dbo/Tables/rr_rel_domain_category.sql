CREATE TABLE [dbo].[rr_rel_domain_category] (
    [rr_ent_domain_id] INT NOT NULL,
    [categories_id]    INT NOT NULL,
    CONSTRAINT [FK_24u5acsmg95bya3hr9493o1f9] FOREIGN KEY ([categories_id]) REFERENCES [dbo].[rr_ent_category] ([id]),
    CONSTRAINT [FK_alc3kjgs1xrhvd6gnsqn09efg] FOREIGN KEY ([rr_ent_domain_id]) REFERENCES [dbo].[rr_ent_domain] ([id]),
    CONSTRAINT [UK_24u5acsmg95bya3hr9493o1f9] UNIQUE NONCLUSTERED ([categories_id] ASC)
);

