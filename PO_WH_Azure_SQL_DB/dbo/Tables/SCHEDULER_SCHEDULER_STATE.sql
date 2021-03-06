﻿CREATE TABLE [dbo].[SCHEDULER_SCHEDULER_STATE] (
    [SCHED_NAME]        VARCHAR (120) NOT NULL,
    [INSTANCE_NAME]     VARCHAR (200) NOT NULL,
    [LAST_CHECKIN_TIME] BIGINT        NOT NULL,
    [CHECKIN_INTERVAL]  BIGINT        NOT NULL,
    CONSTRAINT [SCHEDULER_PK_SCHEDULER_STATE] PRIMARY KEY CLUSTERED ([SCHED_NAME] ASC, [INSTANCE_NAME] ASC)
);

