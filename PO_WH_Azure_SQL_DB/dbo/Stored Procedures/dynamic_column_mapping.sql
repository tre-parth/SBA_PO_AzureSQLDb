

CREATE   PROCEDURE [dbo].[dynamic_column_mapping]
@Carrier varchar(100)
--------DECLARE PARAMETERS WHICH ARE PASSED FROM/TO ADF PIPELINES------------- 
AS
BEGIN
  DECLARE @json_construct varchar(MAX) = '{"type": "TabularTranslator", "mappings": {X}}';
  DECLARE @json VARCHAR(MAX);
 
 IF(@Carrier = 'HCSC')
    Begin
         SET @json = (
         
          SELECT
	       	A.[Column #] AS 'source.ordinal', 
               B.[LEGEND] AS 'sink.name' 
           FROM [m].[tbl_claim_column_mapping] as B join m.tbl_HCSC_column_mapping as A 
	       ON A.[FIELD NAME] = B.[HCSC]
         
           FOR JSON PATH );
	END

 IF(@Carrier = 'Cigna')
    Begin
         SET @json = (
         
         SELECT
	       	A.[Field #] AS 'source.ordinal', 
               B.[LEGEND] AS 'sink.name' 
           FROM [m].[tbl_claim_column_mapping] as B join m.tbl_Claim_Cigna_column_mapping as A 
	       ON A.[FIELD NAME] = B.[CIGNA]
         
           FOR JSON PATH );
	END

    SELECT REPLACE(@json_construct,'{X}', @json) AS json_output;
END