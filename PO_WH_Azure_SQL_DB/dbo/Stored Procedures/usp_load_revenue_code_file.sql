CREATE   PROCEDURE dbo.usp_load_revenue_code_file
AS

SET NOCOUNT ON;


truncate table [stg].[tbl_revenue_codes];

INSERT INTO [stg].[tbl_revenue_codes] 
(
rev_code
,description
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
)
SELECT 
rev_code
,description
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
FROM 
(
SELECT
 CAST(TRIM(rev_code) AS bigint) AS rev_code
,TRIM(description) as description
,0 as run_instance_skey
,0 as source_file_skey
,getdate() as stg_inserted_timestamp
,ROW_NUMBER() OVER (PARTITION BY TRIM(rev_code) ORDER BY TRIM(description) DESC) AS ranks
FROM 
[land].[tbl_revenue_codes] 
) sub_fact
WHERE ranks = 1;

MERGE [dwh].[tbl_revenue_codes]  d
USING [stg].[tbl_revenue_codes]  ds
       ON (d.rev_code = ds.rev_code)
WHEN MATCHED
    THEN UPDATE
         SET 
			 d.description = ds.description
			,d.run_instance_skey = ds.run_instance_skey
			,d.source_file_skey = ds.source_file_skey
			,d.stg_inserted_timestamp = ds.stg_inserted_timestamp
WHEN NOT MATCHED
       THEN INSERT (
             rev_code
			,description
			,run_instance_skey
			,source_file_skey
			,stg_inserted_timestamp)
			VALUES (
             ds.rev_code
			,ds.description
			,ds.run_instance_skey
			,ds.source_file_skey
			,ds.stg_inserted_timestamp
			);
