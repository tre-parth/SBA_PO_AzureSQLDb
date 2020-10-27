CREATE   PROCEDURE dbo.medica_medical_claim_grp_rpt @table_name varchar(50), @column_names varchar(1000)
AS

 

SET NOCOUNT ON;

 

DROP TABLE IF EXISTS land.medica_medical_claim_grp_by_report;
CREATE TABLE land.medica_medical_claim_grp_by_report 
    (
    table_name varchar(50),
    Member_ID bigint,
    column_name varchar(100),
    column_value varchar(100),
    value_count bigint    
    );

 

DECLARE @table_name_out VARCHAR(MAX);
DECLARE @Member_ID VARCHAR(MAX);
DECLARE @column_name VARCHAR(MAX);

 

DECLARE outer_cur CURSOR FOR
    select abc as table_name,Member_ID,str_spl.value as column_names from (select distinct '''tbl_medical_claim_Medica''' as abc,  [Member_ID] as Member_ID from [land].[tbl_medical_claim_Medica]) a cross join string_split(@column_names,',') str_spl

 

OPEN outer_cur;

 

FETCH NEXT FROM outer_cur INTO @table_name,@Member_ID,@column_name
WHILE @@FETCH_STATUS = 0
BEGIN
    exec('EXEC dbo.[medica_medical_claim_grp_rpt_inside] ' + @table_name+ ' , ' + 
    @Member_ID + ' , ' + @column_name +';');
    FETCH NEXT FROM outer_cur INTO @table_name,@Member_ID,@column_name;
END

 

CLOSE outer_cur;
DEALLOCATE outer_cur;

 

