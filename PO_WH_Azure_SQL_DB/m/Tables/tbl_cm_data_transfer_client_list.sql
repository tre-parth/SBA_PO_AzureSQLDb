CREATE TABLE [m].[tbl_cm_data_transfer_client_list] (
    [S.No.]            INT            IDENTITY (1, 1) NOT NULL,
    [client_id]        NVARCHAR (MAX) NULL,
    [client_name]      NVARCHAR (MAX) NULL,
    [channel]          NVARCHAR (MAX) NULL,
    [carrier]          NVARCHAR (MAX) NULL,
    [data_source]      NVARCHAR (MAX) NULL,
    [file_type]        NVARCHAR (MAX) NULL,
    [file_name]        NVARCHAR (MAX) NULL,
    [layout_file_path] NVARCHAR (MAX) NULL,
    [input_file_path]  NVARCHAR (MAX) NULL,
    [po_active]        NVARCHAR (MAX) NULL,
    [aggregate_file]   NVARCHAR (MAX) NULL,
    [Date_Inseted]     DATETIME       CONSTRAINT [DF_tbl_cm_data_transfer_client_list_Date_Inseted] DEFAULT (getdate()) NULL,
    [Date_Updated]     DATETIME       CONSTRAINT [DF_tbl_cm_data_transfer_client_list_Date_Updated] DEFAULT (getdate()) NULL
);

