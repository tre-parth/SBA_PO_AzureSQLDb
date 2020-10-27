CREATE   PROCEDURE dbo.usp_load_icd_pcs_code_file
AS

SET NOCOUNT ON;


truncate table [stg].[tbl_icd_pcs_codes];

INSERT INTO [stg].[tbl_icd_pcs_codes] 
(
icd_pcs
,description
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
)
SELECT 
icd_pcs
,description
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
FROM 
(
SELECT
 TRIM(icd_pcs) AS icd_pcs
,TRIM(description) as description
,0 as run_instance_skey
,0 as source_file_skey
,getdate() as stg_inserted_timestamp
,ROW_NUMBER() OVER (PARTITION BY TRIM(icd_pcs) ORDER BY TRIM(description) DESC) AS ranks
FROM 
[land].[tbl_icd_pcs_codes] 
) sub_fact
WHERE ranks = 1;

MERGE [dwh].[tbl_icd_pcs_codes]  d
USING [stg].[tbl_icd_pcs_codes]  ds
       ON (d.icd_pcs = ds.icd_pcs)
WHEN MATCHED
    THEN UPDATE
         SET 
			 d.description = ds.description
			,d.run_instance_skey = ds.run_instance_skey
			,d.source_file_skey = ds.source_file_skey
			,d.stg_inserted_timestamp = ds.stg_inserted_timestamp
WHEN NOT MATCHED
       THEN INSERT (
             icd_pcs
			,description
			,run_instance_skey
			,source_file_skey
			,stg_inserted_timestamp)
			VALUES (
             ds.icd_pcs
			,ds.description
			,ds.run_instance_skey
			,ds.source_file_skey
			,ds.stg_inserted_timestamp
			);
