

CREATE PROCEDURE [dbo].[Eligibility_dynamic_column_mapping]
@Carrier Varchar(100)
--------DECLARE PARAMETERS WHICH ARE PASSED FROM/TO ADF PIPELINES------------- 
AS
BEGIN
  DECLARE @json_construct varchar(MAX) = '{"type": "TabularTranslator", "mappings": {X}}';
  DECLARE @json VARCHAR(MAX);
  
  SET @json = (
   SELECT
		A.[Column #] AS 'source.ordinal', 
        B.[Data Request] AS 'sink.name' 
    FROM [m].[tbl_Eligibility_header_compare] as B join m.tbl_Eligibility_HCSC_Mapping as A 
	ON A.[FIELD NAME] = B.[HCSC]
	where B.[Data Request] IS NOT NULL
 
    FOR JSON PATH );

	 IF(@Carrier = 'HCSC')
    Begin
        SET @json = (
   SELECT
		A.[Column #] AS 'source.ordinal', 
        B.[Data Request] AS 'sink.name' 
    FROM [m].[tbl_Eligibility_header_compare] as B join m.tbl_Eligibility_HCSC_Mapping as A 
	ON A.[FIELD NAME] = B.[HCSC]
	where B.[Data Request] IS NOT NULL
 
    FOR JSON PATH );
	END

 IF(@Carrier = 'Cigna')
    Begin
         SET @json = (
         
         SELECT
	       	A.[Field #] AS 'source.ordinal', 
               B.[Data Request] AS 'sink.name'		   
           FROM [m].[tbl_Eligibility_header_compare] as B join m.tbl_Eligibility_Cigna_column_mapping as A 
	       ON A.[FIELD NAME] = B.[Cigna *MM table]
		   where B.[Data Request] IS NOT NULL
         
           FOR JSON PATH );
	END

    SELECT REPLACE(@json_construct,'{X}', @json) AS json_output;
END
