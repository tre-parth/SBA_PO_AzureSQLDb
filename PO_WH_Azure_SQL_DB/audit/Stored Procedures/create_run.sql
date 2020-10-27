
CREATE PROCEDURE [audit].[create_run]
@File_type VARCHAR(50)
AS
BEGIN

	DECLARE 
	@RUN_INSTANCE_SKEY INT ,
		@MAX_RUN INT,
		@RUN_STATUS VARCHAR(20),
		@RUN_NAME VARCHAR(20),
		@STATUS VARCHAR(20),
		@Row_Count INT

	SELECT @Row_Count = count(1) from audit.audit_run

	IF (@Row_Count = 0)
	 BEGIN
		SET @MAX_RUN = 1
		SET @RUN_NAME=UPPER('Load For '+CAST(GETDATE() AS VARCHAR(20)))
		SET @STATUS='IN_PROGRESS'

		INSERT INTO audit.audit_run
		(
		   [run_instance_skey]
		   ,[run_name]
		   ,[File_type]
		   ,[run_status]
		   ,[run_start_time]
		   ,[run_end_time]
		   ,[run_date]
		 )
		 
		SELECT 
			@MAX_RUN AS run_instance_skey,
			@RUN_NAME AS run_name,
			@File_type AS File_type,
			@STATUS AS run_status,
			GETDATE() AS run_start_time,
			NULL AS run_end_time,
			CAST(GETDATE() AS DATE) AS run_date

		
		SET @RUN_INSTANCE_SKEY=1

	 END

	 ELSE
	  BEGIN
	     SELECT @MAX_RUN=MAX(run_instance_skey) FROM audit.audit_run 
	     SELECT @RUN_STATUS= ISNULL(run_status,'SUCCESS') FROM audit.audit_run WHERE run_instance_skey=@MAX_RUN
	     SET @RUN_NAME=UPPER('Load For '+CAST(GETDATE() AS VARCHAR(20)))
	     SET @STATUS='IN_PROGRESS'
	    

	     IF (@RUN_STATUS='SUCCESS')
	      BEGIN 
	     
	     	INSERT INTO audit.audit_run
	     	(
	     	   [run_instance_skey]
	     	   ,[run_name]
			   ,[File_type]
	     	   ,[run_status]
	     	   ,[run_start_time]
	     	   ,[run_end_time]
	     	   ,[run_date]
			   
	     	 )
	     	SELECT 
	     		ISNULL(@MAX_RUN,0)+1 AS run_instance_skey,
	     		@RUN_NAME AS run_name,
				@File_type AS File_type,
	     		@STATUS AS run_status,
	     		GETDATE() AS run_start_time,
	     		NULL AS run_end_time,
	     		CAST(GETDATE() AS DATE) AS run_date

	     
	     	
	     	SET @RUN_INSTANCE_SKEY=ISNULL(@MAX_RUN,0)+1
	      END
	     
		  IF (@RUN_STATUS='IN_PROGRESS')
		  BEGIN
			SET @RUN_INSTANCE_SKEY=ISNULL(@MAX_RUN,0)
		  END

	      IF (@RUN_STATUS='FAILED')
	      BEGIN
   	     
            UPDATE audit.audit_run
	        SET run_status=@STATUS
	        WHERE @RUN_INSTANCE_SKEY=ISNULL(@MAX_RUN,0)
	     
	     	SET @RUN_INSTANCE_SKEY=ISNULL(@MAX_RUN,0)
	      END
	  END

 END 







