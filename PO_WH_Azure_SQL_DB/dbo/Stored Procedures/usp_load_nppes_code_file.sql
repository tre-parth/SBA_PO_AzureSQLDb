CREATE   PROCEDURE dbo.usp_load_nppes_code_file
AS

SET NOCOUNT ON;

truncate table [stg].[tbl_nppes_codes];

INSERT INTO [stg].[tbl_nppes_codes] 
(
prov_npi
,prov_nm
,prov_city
,prv_addr1
,prv_addr2
,prov_st
,prov_zip
,prov_type
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
)
SELECT 
prov_npi
,prov_nm
,prov_city
,prv_addr1
,prv_addr2
,prov_st
,prov_zip
,prov_type
,run_instance_skey
,source_file_skey
,stg_inserted_timestamp
FROM 
(
SELECT
prov_npi as prov_npi
,trim(prov_nm) as prov_nm
,trim(prov_city) as prov_city
,trim(prv_addr1) as prv_addr1
,trim(prv_addr2) as prv_addr2
,trim(prov_st) as prov_st
,trim(prov_zip) as prov_zip
,trim(prov_type) as prov_type
,0 as run_instance_skey
,0 as source_file_skey
,getdate() as stg_inserted_timestamp
,ROW_NUMBER() OVER (PARTITION BY prov_npi,trim(prov_nm),trim(prov_city),trim(prv_addr1),trim(prv_addr2),trim(prov_st),trim(prov_zip),trim(prov_type) ORDER BY prov_npi,trim(prov_nm),trim(prov_city),trim(prv_addr1),trim(prv_addr2),trim(prov_st),trim(prov_zip),trim(prov_type)) AS ranks
FROM 
[land].[tbl_nppes_codes] 
) sub_fact
WHERE ranks = 1;

MERGE [dwh].[tbl_nppes_codes]  d
USING [stg].[tbl_nppes_codes]  ds
       ON (d.prov_npi = ds.prov_npi and d.prov_nm=ds.prov_nm)
WHEN MATCHED
    THEN UPDATE
         SET 
			 d.prov_npi = ds.prov_npi
			,d.prov_nm =ds.prov_nm
			,d.prov_city =ds.prov_city
			,d.prv_addr1 =ds.prv_addr1
			,d.prv_addr2 =ds.prv_addr2
			,d.prov_st =ds.prov_st
			,d.prov_zip =ds.prov_zip
			,d.prov_type =ds.prov_type
			,d.run_instance_skey = ds.run_instance_skey
			,d.source_file_skey = ds.source_file_skey
			,d.stg_inserted_timestamp = ds.stg_inserted_timestamp
WHEN NOT MATCHED
       THEN INSERT (
             prov_npi
			,prov_nm
			,prov_city
			,prv_addr1
			,prv_addr2
			,prov_st
			,prov_zip
			,prov_type
			,run_instance_skey
			,source_file_skey
			,stg_inserted_timestamp)
			VALUES (
             ds.prov_npi
			,ds.prov_nm
			,ds.prov_city
			,ds.prv_addr1
			,ds.prv_addr2
			,ds.prov_st
			,ds.prov_zip
			,ds.prov_type
			,ds.run_instance_skey
			,ds.source_file_skey
			,ds.stg_inserted_timestamp
			);
