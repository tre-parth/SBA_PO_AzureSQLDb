

CREATE PROCEDURE [audit].[END_Run]
@run_status VARCHAR(200),
@File_type VARCHAR(200)
AS
BEGIN



UPDATE 
	AUDIT.audit_run
SET 
	run_status = @run_status,
	run_end_time=GETDATE()

WHERE
	run_status = 'IN_PROGRESS'
	AND File_type = @File_type

END