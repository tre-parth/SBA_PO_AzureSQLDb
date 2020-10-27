CREATE TABLE [land].[tbl_msdrg_codes] (
    [seq_key]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [ms_drg]       VARCHAR (100) NULL,
    [mdc]          VARCHAR (10)  NULL,
    [type]         VARCHAR (10)  NULL,
    [ms_drg_title] VARCHAR (500) NULL
);

