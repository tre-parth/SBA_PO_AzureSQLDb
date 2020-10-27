CREATE TABLE [land].[tbl_nppes_codes] (
    [seq_key]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [prov_npi]  BIGINT       NULL,
    [prov_nm]   VARCHAR (70) NULL,
    [prov_city] VARCHAR (40) NULL,
    [prv_addr1] VARCHAR (55) NULL,
    [prv_addr2] VARCHAR (55) NULL,
    [prov_st]   VARCHAR (40) NULL,
    [prov_zip]  VARCHAR (20) NULL,
    [prov_type] VARCHAR (10) NULL
);

