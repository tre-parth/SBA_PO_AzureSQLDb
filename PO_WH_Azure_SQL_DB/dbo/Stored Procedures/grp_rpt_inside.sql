
CREATE   PROCEDURE [dbo].[grp_rpt_inside] @table_name varchar(50), @account_number bigint, @column_name varchar(100)
AS

SET NOCOUNT ON;
DECLARE cur_grp CURSOR FOR
    SELECT concat('INSERT INTO land.hcsc_eligibility_grp_by (column_name,column_value,value_count)  SELECT ''' , @column_name ,''', ', QUOTENAME(@column_name) , ', count(1) as value_count' , ' FROM [land].',QUOTENAME(@table_name)+' where [Account Number]=' , cast (@account_number as varchar(100)),' group by ',QUOTENAME(@column_name))


DECLARE @cmd VARCHAR(MAX);
OPEN cur_grp;

FETCH NEXT FROM cur_grp INTO @cmd;
WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC(@cmd);

    FETCH NEXT FROM cur_grp INTO @cmd;
END

CLOSE cur_grp;
DEALLOCATE cur_grp;

update land.hcsc_eligibility_grp_by set
table_name=@table_name,
account_number=@account_number from land.hcsc_eligibility_grp_by where table_name is null;

