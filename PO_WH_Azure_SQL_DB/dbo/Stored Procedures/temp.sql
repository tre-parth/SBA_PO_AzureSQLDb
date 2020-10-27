CREATE   PROCEDURE [dbo].[temp]
AS

SET NOCOUNT ON;

DROP TABLE IF EXISTS land.hcsc_eligibility_null_report;
CREATE TABLE land.hcsc_eligibility_null_report
    (
    table_name varchar(50),
    account_number bigint,
    column_name varchar(100),
    total_count bigint,
    null_count bigint    
    );

DECLARE @table_name VARCHAR(MAX);
DECLARE @account_number VARCHAR(MAX);

DECLARE outer_cur CURSOR FOR
    select distinct '''tbl_eligibility_HCSC''',  [Account Number] from [land].[tbl_eligibility_HCSC]


OPEN outer_cur;

FETCH NEXT FROM outer_cur INTO @table_name,@account_number;
WHILE @@FETCH_STATUS = 0
BEGIN
    exec('EXEC dbo.[usp_oa_ds_device_master_load] ' + @table_name+ ' , ' + 
    @account_number + ';');
    FETCH NEXT FROM outer_cur INTO @table_name,@account_number;
END

CLOSE outer_cur;
DEALLOCATE outer_cur;

update land.report_temp
set total_count=b.cnt
from land.report_temp a join (select [Account Number] as account_number,count(1) as cnt from [land].[tbl_eligibility_HCSC] group by [Account Number]) b
on a.account_number=b.account_number;
