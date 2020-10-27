

CREATE PROCEDURE [audit].[manage_audit_pipeline_start]
@process_type VARCHAR(200),
@process_name VARCHAR(200),
@STAGE_SKEY VARCHAR(200),
@PIPELINE_NAME VARCHAR(200),
@FILE_NAME VARCHAR(300),
@PIPELINE_SKEY VARCHAR(200)
AS
BEGIN


  select run_instance_skey  from audit.audit_run;


INSERT INTO audit.audit_job_process_execution_log
( run_instance_skey,
  stage_skey,
  pipeline_skey,
  process_type,
  process_name,
  source_name,
  load_start_time,
  load_status
 )
 SELECT 
   run_instance_skey,
   @STAGE_SKEY AS stage_skey,
   @PIPELINE_SKEY AS pipeline_skey,
   @process_type,
   @process_name,
   @FILE_NAME AS source_name,
   GETDATE() AS load_start_time,
   'IN_PROGRESS' AS load_status
   from audit.audit_run
  where run_status = 'IN_PROGRESS';
 


 END



 