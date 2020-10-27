

CREATE PROCEDURE  [dbo].[Data_Validation_Eligibility]
@Account_ID int,
@filename varchar(100),
@Client varchar(100),
@Carrier varchar(100),
@File_Type varchar(100),
@Record_Count int,
@month int,
@year int,
@flag VARCHAR(MAX) OUTPUT

AS
BEGIN


SET @flag = ''

select @flag = @flag +
                 (case when count(*) <> @Record_Count then 'Row Count Failed' else '' end)
		   FROM land.tbl_eligibility

if @flag = ''
	begin
	set @flag = 'DATA Validation Successful' 
	end

INSERT INTO audit.tbl_DataValidation
(
[Account_ID],
[Carrier],
[Client],
[File_Type],
[File_Name],
[Record_Count_Expected],
[Record_Count_Actual],
[Flag],
[Month],
[Year]
)
SELECT
	   @Account_ID,@Carrier,@Client,@File_Type,@filename,@Record_Count,count(*),
       @flag,@month,@year
		FROM land.tbl_eligibility where [Account Number] = @Account_ID


END

select top(100)* from land.tbl_eligibility