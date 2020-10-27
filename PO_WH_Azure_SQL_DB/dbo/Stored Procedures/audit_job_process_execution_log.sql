

CREATE PROCEDURE  [dbo].[audit_job_process_execution_log]
@pipeline_key VARCHAR(100),
@process_name VARCHAR(100),
@source_name VARCHAR(100),
@destination_name VARCHAR(100),
@source_row_count int,
@destination_row_count int,
@error VARCHAR(100),
@duration int,
@load_status VARCHAR(100)

AS
BEGIN
	

INSERT INTO [audit].[audit_job_process_execution_log]
(
      run_instance_skey,pipeline_skey,stage_skey, process_name, source_name,destination_name,source_row_count,destination_row_count,insert_count
      ,load_status,message,load_start_time,load_end_time
)

values (1,1,10,@process_name,@source_name,@destination_name,@source_row_count,@destination_row_count,@destination_row_count,@load_status,@error,
DATEADD(SS,-@duration,GETDATE()),GETDATE()) 
END




