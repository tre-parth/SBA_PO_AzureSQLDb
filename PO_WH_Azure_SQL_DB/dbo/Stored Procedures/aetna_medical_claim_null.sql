CREATE   PROCEDURE dbo.aetna_medical_claim_null
AS

SET NOCOUNT ON;

DROP TABLE IF EXISTS land.aetna_medical_claim_null_report;
CREATE TABLE land.aetna_medical_claim_null_report 
    (
    table_name varchar(50),
    ps_unique_id varchar(16),
    column_name varchar(100),
    total_count bigint,
    null_count bigint    
    );

DECLARE @table_name VARCHAR(MAX);
DECLARE @ps_unique_id VARCHAR(MAX);

DECLARE outer_cur CURSOR FOR
    select distinct '''tbl_medical_claim_aetna''',  [ps_unique_id] from [stg].[tbl_medical_claim_aetna]


OPEN outer_cur;

FETCH NEXT FROM outer_cur INTO @table_name,@ps_unique_id;
WHILE @@FETCH_STATUS = 0
BEGIN
    exec('EXEC dbo.aetna_medical_claim_null_report_inside ' + @table_name+ ' , ' + 
    @ps_unique_id + ';');
    FETCH NEXT FROM outer_cur INTO @table_name,@ps_unique_id;
END

CLOSE outer_cur;
DEALLOCATE outer_cur;

update land.aetna_medical_claim_null_report
set total_count=b.cnt
from land.aetna_medical_claim_null_report a join (select [ps_unique_id] as ps_unique_id,count(1) as cnt from [stg].[tbl_medical_claim_aetna] group by [ps_unique_id]) b
on RIGHT(REPLICATE('0', 16) + a.[ps_unique_id], 16)=RIGHT(REPLICATE('0', 16) + b.[ps_unique_id], 16);
