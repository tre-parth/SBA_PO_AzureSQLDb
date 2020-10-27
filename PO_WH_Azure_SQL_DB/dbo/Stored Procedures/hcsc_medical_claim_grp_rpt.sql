CREATE   PROCEDURE dbo.hcsc_medical_claim_grp_rpt @table_name varchar(50), @column_names varchar(1000)
AS

SET NOCOUNT ON;


DECLARE @table_name_out VARCHAR(MAX);
DECLARE @account_number VARCHAR(MAX);
DECLARE @column_name VARCHAR(MAX);

DECLARE outer_cur CURSOR FOR
    select abc as table_name,account_number,str_spl.value as column_names from (select distinct '''tbl_medical_claim_HCSC''' as abc,  [Account_Number] as account_number from [land].[tbl_medical_claim_HCSC]) a cross join string_split(@column_names,',') str_spl

OPEN outer_cur;

FETCH NEXT FROM outer_cur INTO @table_name,@account_number,@column_name
WHILE @@FETCH_STATUS = 0
BEGIN
    exec('EXEC dbo.[hcsc_medical_claim_grp_rpt_inside] ' + @table_name+ ' , ' + 
    @account_number + ' , ' + @column_name +';');
    FETCH NEXT FROM outer_cur INTO @table_name,@account_number,@column_name;
END

CLOSE outer_cur;
DEALLOCATE outer_cur;

