

CREATE PROCEDURE  [dbo].[File_Details]
@RUN_INSTANCE_SKEY INT,
@source_file_path varchar(100),
@carrier_name varchar(100),
@client_name varchar(100),
@year int,
@month int


AS
BEGIN


INSERT INTO [m].[file_details]
(
[run_instance_skey]
      ,[source_file_path]
      ,[carrier_name]
      ,[client_name]
      ,[year]
      ,[month]
      ,[load_time]
)
SELECT
@RUN_INSTANCE_SKEY,
@source_file_path,
@carrier_name,
@client_name,
@year,
@month,
GETDATE()

select [source_file_skey] from [m].[file_details]
WHERE
[run_instance_skey]  = @RUN_INSTANCE_SKEY AND
 cast([source_file_path] as varchar(100)) = @source_file_path AND
      [carrier_name] = @carrier_name AND
      [client_name] = @client_name AND
      [year] = @year AND
      [month] = @month

END
