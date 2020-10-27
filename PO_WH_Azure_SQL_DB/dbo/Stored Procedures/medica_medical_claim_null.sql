CREATE   PROCEDURE dbo.medica_medical_claim_null
AS

 

SET NOCOUNT ON;

 

DROP TABLE IF EXISTS land.medica_medical_claim_null_report;
CREATE TABLE land.medica_medical_claim_null_report 
    (
    table_name varchar(50),
    Member_ID bigint,
    column_name varchar(100),
    total_count bigint,
    null_count bigint    
    );

 

DECLARE @table_name VARCHAR(MAX);
DECLARE @Member_ID VARCHAR(MAX);

 

DECLARE outer_cur CURSOR FOR
    select distinct '''tbl_medical_claim_Medica''',  [Member_ID] from [land].[tbl_medical_claim_Medica]

 


OPEN outer_cur;

 

FETCH NEXT FROM outer_cur INTO @table_name,@Member_ID;
WHILE @@FETCH_STATUS = 0
BEGIN
    exec('EXEC dbo.medica_medical_claim_null_report_inside ' + @table_name+ ' , ' + 
    @Member_ID + ';');
    FETCH NEXT FROM outer_cur INTO @table_name,@Member_ID;
END

 

CLOSE outer_cur;
DEALLOCATE outer_cur;

 

update land.medica_medical_claim_null_report
set total_count=b.cnt
from land.medica_medical_claim_null_report a join (select [Member_ID] as Member_ID,count(1) as cnt from [land].[tbl_medical_claim_Medica] group by [Member_ID]) b
on a.Member_ID=b.Member_ID;
