CREATE   PROCEDURE dbo.cigna_eligibility_null
AS

SET NOCOUNT ON;

DROP TABLE IF EXISTS land.cigna_eligibilty_null_report;
CREATE TABLE land.cigna_eligibilty_null_report 
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
    select distinct '''tbl_eligibility_cigna''',  [Account Number] from [stg].[tbl_eligibility_cigna]


OPEN outer_cur;

FETCH NEXT FROM outer_cur INTO @table_name,@account_number;
WHILE @@FETCH_STATUS = 0
BEGIN
    exec('EXEC dbo.cigna_eligibilty_null_report_inside ' + @table_name+ ' , ' + 
    @account_number + ';');
    FETCH NEXT FROM outer_cur INTO @table_name,@account_number;
END

CLOSE outer_cur;
DEALLOCATE outer_cur;

update land.cigna_eligibilty_null_report
set total_count=b.cnt
from land.cigna_eligibilty_null_report a join (select [Account Number] as account_number,count(1) as cnt from [stg].[tbl_eligibility_cigna] group by [Account Number]) b
on a.account_number=b.account_number;
