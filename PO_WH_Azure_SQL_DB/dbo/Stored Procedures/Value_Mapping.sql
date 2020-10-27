
CREATE PROCEDURE [dbo].[Value_Mapping]
@carrier varchar(50),
@field_name varchar(100)

AS
Begin

update land.test_tbl_medical_claim_HCSC 
set @field_name = 'Value not available or Not succefully mapped' 
where @field_name not in (select code from map.HCSC_medical_claim_reference_tbl 
where field_name = @field_name)

declare @sql1 nvarchar(max);

set @sql1 = 'Update land.test_tbl_medical_claim_HCSC
SET ' + @field_name +' = A.Description
From land.test_tbl_medical_claim_HCSC AS Main
INNER JOIN map.HCSC_medical_claim_reference_tbl AS A ON A.Code = Main.'+ @field_name +
' where A.field_name = ''' + @field_name + ''' AND Main.'+ @field_name + ' = Value not available or Not succefully mapped' ;

exec sp_executesql @sql1

END