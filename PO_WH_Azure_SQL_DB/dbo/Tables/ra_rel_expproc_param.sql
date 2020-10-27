CREATE TABLE [dbo].[ra_rel_expproc_param] (
    [process_id] VARCHAR (255) NOT NULL,
    [param_id]   INT           NOT NULL,
    CONSTRAINT [FK_gi2p237mr2gw6wddtt99dlw1j] FOREIGN KEY ([param_id]) REFERENCES [dbo].[ra_ent_parametermapping] ([id]),
    CONSTRAINT [FK_ii0eaa4t8732s1qqc1kpuaexf] FOREIGN KEY ([process_id]) REFERENCES [dbo].[ra_ent_exportedprocess] ([serviceId]),
    CONSTRAINT [UK_gi2p237mr2gw6wddtt99dlw1j] UNIQUE NONCLUSTERED ([param_id] ASC)
);

