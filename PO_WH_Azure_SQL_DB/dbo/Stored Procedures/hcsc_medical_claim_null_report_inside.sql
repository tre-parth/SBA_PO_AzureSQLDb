CREATE     PROCEDURE dbo.hcsc_medical_claim_null_report_inside @table_name varchar(50), @account_number bigint
AS

SET NOCOUNT ON;
DECLARE cur CURSOR FOR
    SELECT 'INSERT INTO land.hcsc_medical_claim_null_report (null_count,column_name)  SELECT count(1) as null_count, ''' + QUOTENAME(COLUMN_NAME) + ''' FROM ' + QUOTENAME(TABLE_CATALOG) + '.' + QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) + ' where ' + QUOTENAME(c.COLUMN_NAME) + ' IS NULL and [Account_Number]=' + cast (@account_number as varchar(100)) ';'
    FROM INFORMATION_SCHEMA.COLUMNS AS c
    WHERE c.TABLE_NAME = @table_name
	AND c.TABLE_SCHEMA = 'land'

DECLARE @cmd VARCHAR(MAX);
OPEN cur;

FETCH NEXT FROM cur INTO @cmd;
WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC(@cmd);

    FETCH NEXT FROM cur INTO @cmd;
END

CLOSE cur;
DEALLOCATE cur;

update land.hcsc_medical_claim_null_report set
table_name=@table_name,
account_number=@account_number from land.hcsc_medical_claim_null_report where table_name is null;

