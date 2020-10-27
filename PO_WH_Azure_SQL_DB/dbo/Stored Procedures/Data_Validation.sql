

CREATE PROCEDURE  [dbo].[Data_Validation]
@Account_ID int,
@filename varchar(100),
@Client varchar(100),
@Carrier varchar(100),
@File_Type varchar(100),
@Paid_Period_Lower VARCHAR(100),
@Paid_Period_Upper VARCHAR(100),
@Record_Count int,
@Total_Deductible_Amount decimal(18,2),
@Total_Coinsurance_Amount decimal(18,2),
@Total_Copay_Amount decimal(18,2),
@Total_Paid_Amount decimal(18,2),
@month int,
@year int,
@flag VARCHAR(MAX) OUTPUT

AS
BEGIN


SET @flag = ''

select @flag = @flag +
                 (case when min(Paid_date) <> @Paid_Period_lower OR  max(Paid_date) <> @Paid_Period_Upper then ' Paid Period,' else '' end) +
                 (case when count(*) <> @Record_Count then 'Row Count,' else '' end) +
                 (CASE WHEN sum(cast(Deductible as decimal(18,2))) <> @Total_Deductible_Amount THEN 'Deductible_Amount,' else '' end)+
				 (CASE WHEN sum(cast(Coinsurance_amount as decimal(18,2))) <> @Total_Coinsurance_Amount THEN 'Coinsurance_Amount,' else '' end)+
	       (CASE WHEN sum(cast(Copay_amount as decimal(18,2))) <> @Total_Copay_amount THEN 'Copay_Amount,' else '' end)+
	       (CASE WHEN sum(cast(Paid_amount as decimal(18,2))) <> @Total_Paid_amount THEN 'Paid_Amount' else '' end)
		   FROM land.tbl_medical_claim

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
[Paid_Period_Expected],
[Paid_Period_Actual],
[Record_Count_Expected],
[Record_Count_Actual],
[Total_Deductible_Amount_Expected],
[Total_Deductible_Amount_Actual],
[Total_Coinsurance_Amount_Expected],
[Total_Coinsurance_Amount_Actual],
[Total_Copay_Amount_Expected],
[Total_Copay_Amount_Actual],
[Total_Paid_Amount_Expected],
[Total_Paid_Amount_Actual],
[Flag],
[Month],
[Year]
)
SELECT
	   @Account_ID,@Carrier,@Client,@File_Type,@filename,concat(@Paid_Period_Lower,' to ',@Paid_Period_Upper),concat(min(Paid_date),' to ',max(Paid_date)),
	   @Record_Count,count(*),@Total_Deductible_Amount,sum(cast(Deductible as decimal(38,2))),@Total_Coinsurance_Amount,
	   sum(cast(Coinsurance_amount as decimal(38,2))),@Total_Copay_Amount,sum(cast(Copay_amount as decimal(38,2))),@Total_Paid_Amount,
	   sum(cast(Paid_amount as decimal(38,2))),
       @flag,@month,@year
		FROM land.tbl_medical_claim where Account_Number = @Account_ID


END