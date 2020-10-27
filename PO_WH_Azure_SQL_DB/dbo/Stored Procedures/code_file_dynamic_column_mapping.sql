CREATE    PROCEDURE [dbo].[code_file_dynamic_column_mapping]
@stage_table_name varchar(100)
--------DECLARE PARAMETERS WHICH ARE PASSED FROM/TO ADF PIPELINES------------- 
AS
BEGIN
  DECLARE @json_construct varchar(MAX) = '{"type": "TabularTranslator", "mappings": {X}}';
  DECLARE @json VARCHAR(MAX);
 

SET @json = (    
    SELECT source_column_name AS 'source.name', 
               target_column_name AS 'sink.name' 
           FROM [m].[tbl_code_files_mapping] where target_table_name=@stage_table_name
         
           FOR JSON PATH );
	

    SELECT REPLACE(@json_construct,'{X}', @json) AS json_output;
END
