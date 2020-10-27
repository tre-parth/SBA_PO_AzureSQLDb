
CREATE   PROCEDURE dbo.aetna_medical_claim_grp_rpt @table_name varchar(50), @column_names varchar(1000)
AS

SET NOCOUNT ON;

DROP TABLE IF EXISTS land.aetna_medical_claim_grp_by_report;
CREATE TABLE land.aetna_medical_claim_grp_by_report 
    (
    table_name varchar(50),
    ps_unique_id varchar(16),
    column_name varchar(100),
    column_value varchar(100),
    value_count bigint    
    );

DECLARE @table_name_out VARCHAR(MAX);
DECLARE @ps_unique_id VARCHAR(MAX);
DECLARE @column_name VARCHAR(MAX);

DECLARE outer_cur CURSOR FOR
    select abc as table_name,ps_unique_id,str_spl.value as column_names from (select distinct '''tbl_medical_claim_aetna''' as abc,  [ps_unique_id] as ps_unique_id from [stg].[tbl_medical_claim_aetna]) a cross join string_split(@column_names,',') str_spl

OPEN outer_cur;

FETCH NEXT FROM outer_cur INTO @table_name,@ps_unique_id,@column_name
WHILE @@FETCH_STATUS = 0
BEGIN
    exec('EXEC dbo.[aetna_medical_claim_grp_rpt_inside] ' + @table_name+ ' , ' + 
    @ps_unique_id + ' , ' + @column_name +';');
    FETCH NEXT FROM outer_cur INTO @table_name,@ps_unique_id,@column_name;
END

CLOSE outer_cur;
DEALLOCATE outer_cur;

