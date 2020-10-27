

CREATE PROCEDURE [audit].[manage_audit_pipeline_end]
@RUN_INSTANCE_SKEY INT,
@PIPELINE_NAME VARCHAR(50),
@FILE_NAME VARCHAR(200),
@DESTINATION_NAME VARCHAR(30),
@TARGET_RW_CNT INT,
@SRC_RW_COUNT INT,
@BAD_RW_COUNT INT,
@DUPLICATE_COUNT INT,
@PACKAGE_STATUS VARCHAR(10),
@PIPELINE_SKEY INT,
@DELETE_COUNT INT
AS
BEGIN


	SELECT DATEDIFF(minute, load_start_time, GETDATE()) as Load_time from audit.audit_job_process_execution_log 
	WHERE
	run_instance_skey=@RUN_INSTANCE_SKEY
	AND pipeline_skey =@PIPELINE_SKEY
	AND source_name= @FILE_NAME
    AND load_status='IN_PROGRESS' 


UPDATE 
	AUDIT.AUDIT_JOB_PROCESS_EXECUTION_LOG
SET 
	destination_name=@DESTINATION_NAME,
	destination_row_count=@TARGET_RW_CNT,
	load_status=@PACKAGE_STATUS,
	load_end_time=GETDATE(), 
	source_row_count=@SRC_RW_COUNT,
	duplicate_count=@DUPLICATE_COUNT,
	update_count=@BAD_RW_COUNT,
	rejection_count=@SRC_RW_COUNT-@TARGET_RW_CNT,
	file_processed_flag='Y'
WHERE
	run_instance_skey=@RUN_INSTANCE_SKEY
	AND pipeline_skey =@PIPELINE_SKEY
    AND source_name= @FILE_NAME
    AND load_status='IN_PROGRESS'


	
END