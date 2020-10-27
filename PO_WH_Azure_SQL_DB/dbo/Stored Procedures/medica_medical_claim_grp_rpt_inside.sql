CREATE   PROCEDURE dbo.medica_medical_claim_grp_rpt_inside @table_name varchar(50), @Member_ID bigint, @column_name varchar(100)
AS

 

SET NOCOUNT ON;
DECLARE cur_grp CURSOR FOR
    SELECT concat('INSERT INTO land.medica_medical_claim_grp_by_report (column_name,column_value,value_count)  SELECT ''' , @column_name ,''', ', QUOTENAME(@column_name) , ', count(1) as value_count' , ' FROM [stg].',QUOTENAME(@table_name)+' where [Member_ID]=' , cast (@Member_ID as varchar(100)),' group by ',QUOTENAME(@column_name))

 


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

 

update land.medica_medical_claim_grp_by_report set
table_name=@table_name,
Member_ID=@Member_ID from land.medica_medical_claim_grp_by_report where table_name is null;

 

