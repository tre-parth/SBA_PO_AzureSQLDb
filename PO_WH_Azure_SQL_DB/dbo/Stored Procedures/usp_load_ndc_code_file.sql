CREATE   PROCEDURE dbo.usp_load_ndc_code_file AS

SET NOCOUNT ON;


truncate table [stg].[tbl_ndc_codes];

INSERT INTO [stg].[tbl_ndc_codes] 
(
product_ndc
,ndc_package_code
,product_id
,package_description
,start_marketing_date
,end_marketing_date
,ndc_exclude_flag
,sample_package
,product_type_name
,proprietary_name
,non_proprietary_name
,dosage_form_name
,route_name
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
)
SELECT 
product_ndc
,ndc_package_code
,product_id
,package_description
,start_marketing_date
,end_marketing_date
,ndc_exclude_flag
,sample_package
,product_type_name
,proprietary_name
,non_proprietary_name
,dosage_form_name
,route_name
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
FROM 
(
SELECT
 CAST(TRIM(product_ndc) AS bigint) AS product_ndc
,CAST(TRIM(ndc_package_code) AS bigint) AS ndc_package_code
,TRIM(product_id) as product_id
,TRIM(package_description) as package_description
,cast(start_marketing_date as date) as start_marketing_date
,cast(end_marketing_date as date) as end_marketing_date
,TRIM(ndc_exclude_flag) as ndc_exclude_flag
,TRIM(sample_package) as sample_package
,TRIM(product_type_name) as product_type_name
,TRIM(proprietary_name) as proprietary_name
,TRIM(non_proprietary_name) as non_proprietary_name
,TRIM(dosage_form_name) as dosage_form_name
,TRIM(route_name) as route_name
,0 as run_instance_skey
,0 as source_file_skey
,getdate() as stg_inserted_timestamp
,ROW_NUMBER() OVER (PARTITION BY TRIM(ndc_package_code) ORDER BY start_marketing_date DESC,end_marketing_date DESC,product_ndc,product_id,dosage_form_name) AS ranks
FROM 
[land].[tbl_ndc_codes] 
) sub_fact
WHERE ranks = 1;

MERGE [dwh].[tbl_ndc_codes]  d
USING [stg].[tbl_ndc_codes]  ds
       ON (d.ndc_package_code = ds.ndc_package_code)
WHEN MATCHED
    THEN UPDATE
         SET 
			 d.product_ndc = ds.product_ndc
			,d.product_id = ds.product_id
			,d.package_description = ds.package_description
			,d.start_marketing_date = ds.start_marketing_date
			,d.end_marketing_date = ds.end_marketing_date
			,d.ndc_exclude_flag = ds.ndc_exclude_flag
			,d.sample_package = ds.sample_package
			,d.product_type_name = ds.product_type_name
			,d.proprietary_name = ds.proprietary_name
			,d.non_proprietary_name = ds.non_proprietary_name
			,d.dosage_form_name = ds.dosage_form_name
			,d.route_name = ds.route_name
			,d.run_instance_skey = ds.run_instance_skey
			,d.source_file_skey = ds.source_file_skey
			,d.stg_inserted_timestamp = ds.stg_inserted_timestamp
WHEN NOT MATCHED
       THEN INSERT (
             product_ndc
			,ndc_package_code
			,product_id
			,package_description
			,start_marketing_date
			,end_marketing_date
			,ndc_exclude_flag
			,sample_package
			,product_type_name
			,proprietary_name
			,non_proprietary_name
			,dosage_form_name
			,route_name
			,run_instance_skey
			,source_file_skey
			,stg_inserted_timestamp)
			VALUES (
			 ds.product_ndc
			,ds.ndc_package_code
			,ds.product_id
			,ds.package_description
			,ds.start_marketing_date
			,ds.end_marketing_date
			,ds.ndc_exclude_flag
			,ds.sample_package
			,ds.product_type_name
			,ds.proprietary_name
			,ds.non_proprietary_name
			,ds.dosage_form_name
			,ds.route_name
			,ds.run_instance_skey
			,ds.source_file_skey
			,ds.stg_inserted_timestamp
			);
