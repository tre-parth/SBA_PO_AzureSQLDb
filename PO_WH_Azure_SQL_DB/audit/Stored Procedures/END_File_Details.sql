

CREATE PROCEDURE [audit].[END_File_Details]
@RUN_INSTANCE_SKEY INT,
@source_file_path varchar(100),
@archive_file_path varchar(100),
@reject_file_path varchar(100),
@carrier_name varchar(100),
@client_name varchar(100),
@year int,
@month int,
@Flag varchar(20)
AS
BEGIN

IF( @Flag = 'Success')
Begin

UPDATE 
	[m].[file_details]
SET 
	[archive_file_path] = @archive_file_path,
	[reject_file_path] = '-',
	[Flag] = 'Y'

WHERE
[run_instance_skey]  = @RUN_INSTANCE_SKEY AND
 cast([source_file_path] as varchar(100)) = @source_file_path AND
      [carrier_name] = @carrier_name AND
      [client_name] = @client_name AND
      [year] = @year AND
      [month] = @month 

END

ELSE
Begin
UPDATE 
	[m].[file_details]
SET 
	[archive_file_path] = '-',
	[reject_file_path] = @reject_file_path,
	[Flag] = 'N'

WHERE
[run_instance_skey]  = @RUN_INSTANCE_SKEY AND
 cast([source_file_path] as varchar(100)) = @source_file_path AND
      [carrier_name] = @carrier_name AND
      [client_name] = @client_name AND
      [year] = @year AND
      [month] = @month 
END


END

