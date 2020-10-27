CREATE   PROCEDURE dbo.usp_load_msdrg_code_file
AS

SET NOCOUNT ON;


truncate table [stg].[tbl_msdrg_codes];

INSERT INTO [stg].[tbl_msdrg_codes] 
(
ms_drg
,mdc
,type
,ms_drg_title
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
)
SELECT 
ms_drg
,mdc
,type
,ms_drg_title
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
FROM 
(
SELECT
 CAST(TRIM(ms_drg) AS bigint) AS ms_drg
,TRIM(mdc) as mdc
,TRIM(type) as type
,TRIM(ms_drg_title) as ms_drg_title
,0 as run_instance_skey
,0 as source_file_skey
,getdate() as stg_inserted_timestamp
,ROW_NUMBER() OVER (PARTITION BY TRIM(ms_drg) ORDER BY TRIM(mdc) DESC,TRIM(type) DESC,TRIM(ms_drg_title) desc) AS ranks
FROM 
[land].[tbl_msdrg_codes] 
) sub_fact
WHERE ranks = 1;

MERGE [dwh].[tbl_msdrg_codes]  d
USING [stg].[tbl_msdrg_codes]  ds
       ON (d.ms_drg = ds.ms_drg)
WHEN MATCHED
    THEN UPDATE
         SET 
			 d.ms_drg = ds.ms_drg
			,d.mdc = ds.mdc
			,d.type = ds.type
			,d.ms_drg_title = ds.ms_drg_title
			,d.run_instance_skey = ds.run_instance_skey
			,d.source_file_skey = ds.source_file_skey
			,d.stg_inserted_timestamp = ds.stg_inserted_timestamp
WHEN NOT MATCHED
       THEN INSERT (
             ms_drg
			,mdc
			,type
			,ms_drg_title
			,run_instance_skey
			,source_file_skey
			,stg_inserted_timestamp)
			VALUES (
             ds.ms_drg
			,ds.mdc
			,ds.type
			,ds.ms_drg_title
			,ds.run_instance_skey
			,ds.source_file_skey
			,ds.stg_inserted_timestamp
			);
