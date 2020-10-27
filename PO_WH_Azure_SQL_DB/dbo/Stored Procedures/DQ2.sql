

CREATE PROCEDURE  [dbo].[DQ2]
@filename varchar(100),
@Client varchar(100),
@Carrier varchar(100),
@File_Type varchar(100),
@filesize varchar(100),
@schema varchar(100),
@landing_table Varchar(100),
@staging_table Varchar(100),
@month int,
@year int,
@flag VARCHAR(MAX)

AS
BEGIN

--------------Size Check---------------------

		DECLARE @File_Variance DECIMAL(10,2); 
        DECLARE @Size_Comment VARCHAR(MAX); 


	SET @File_Variance = 
                (
                    Select top(1)
       Variance     = ((avg(Filesize+0.0) over (Order By MonthYear ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING)-@filesize)*100 / 
						(avg(Filesize+0.0) over (Order By MonthYear ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING)))
	  From  audit.DQ2 as A
	  WHERE carrier = @Carrier and client = @Client AND file_type = @file_type
 Order by MonthYear Desc)

	 IF(ABS(@File_Variance) <= 10)
		 BEGIN 
				SET @Size_Comment = 'Within Limits'
		end
	else
	Begin
	SET  @Size_Comment = 'Outside Limits'
	END

-----------------------Member Check-------------------------

		DECLARE @Member_ID_Count DECIMAL(10,2); 
        DECLARE @Count_Comment VARCHAR(MAX); 
		DECLARE @Record_Count_Member_ID int;
		DECLARE @Member_ID_Comment VARCHAR(MAX); 

	Set @Record_Count_Member_ID = (
	select count(distinct Member_ID) from concat(@schema,'.',@landing_table)
	)
	SET @Member_ID_Count = 
                (
                    Select top(1)
       Variance     = ((avg(Member_ID_Count+0.0) over (Order By MonthYear ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING)-@Record_Count_Member_ID)*100 / 
						(avg(Member_ID_Count+0.0) over (Order By MonthYear ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING)))
	  From  audit.DQ2 as A
	  WHERE carrier = @Carrier and client = @Client AND file_type = @file_type
 Order by MonthYear Desc)

	 IF(ABS(@Member_ID_Count) <= 10)
		 BEGIN 
				SET @Member_ID_Comment = 'Within Limits'
		end
	else
	Begin
	SET  @Member_ID_Comment = 'Outside Limits'
	END

--------------------------------------------------------------------------------------
		DECLARE @Eligibility_Months Varchar(MAX); 
        DECLARE @Month_Comment VARCHAR(MAX); 

select * from concat(@schema,'.',@staging_table)
where (month(Eligibity_to)) IN
(select distinct(month(Eligibity_to)) as eligibility_to 

WHERE carrier = @Carrier and client = @Client)

select * from concat(@schema,'.',@landing_table)
where (month(Eligibity_from)) IN
(select distinct(month(Eligibity_from)) as eligibility_to 
WHERE carrier = @Carrier and client = @Client)













INSERT INTO audit.DQ2
(
[Carrier],
[Client],
[File_Type],
[File_Size],
[Record_Count_Expected],
[Flag],
[Month],
[Year]
)
SELECT
	   @Carrier,@Client,@File_Type,@filename,count(*),
       @flag,@month,@year
		FROM land.tbl_eligibility
END
