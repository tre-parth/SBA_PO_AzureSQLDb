

--DROP PROCEDURE IF EXISTS [stg].[USP_LOAD_REVENUE_CODE]

CREATE PROCEDURE [stg].[USP_LOAD_REVENUE_CODE]
@STATUS INT OUTPUT,
@MESSAGE VARCHAR(255) OUTPUT
AS

BEGIN

BEGIN TRY

  BEGIN TRANSACTION 

 /*-------------------SPROC DESCRIPTION---------------------------

 INFO:
 --> DATA FREQUENCY IS "AD-HOC"
 --> LOAD STRATEGY IS "UPDATE & INSERT" 

 CONSTRAINTS:
 --> INCREMENTAL LOAD BASED ON 'REVENUE_CODE' 


 CHANGE LOG:

 CHANGE_ID  DATE				AUTHOR					CHANGE

 1			AUG 25, 2020		VENKATESH MEKEWAR		INITIAL VERSION 

 ----------------------------------------------------------------*/

 --------DECLARE VARIABLES-------------
 DECLARE 

  @V_STATUS VARCHAR(20),
  @UPDATE_COUNT INT,
  @DELETE_COUNT INT,
  @INSERT_COUNT INT,
  @SOURCE_COUNT INT,
  @DESTINATION_COUNT INT,
  @LOAD_START_TIME DATETIME,
  @LOAD_END_TIME DATETIME

  --------SET VARIABLES-------------

  SET @LOAD_START_TIME = GETDATE()

 --- CAPTURE SOURCE AND DESTINATION COUNT 

 SELECT  @SOURCE_COUNT = COUNT(*) FROM [stg].[tbl_revenue_codes]

 SELECT  @DESTINATION_COUNT = COUNT(*) FROM [map].[tbl_revenue_codes]

 
--- IDENTIFY IF RECORD EXISTS THEN PERFORM UPDATE 

DROP TABLE IF EXISTS tmp_tbl_revenue_code;

SELECT *
INTO tmp_tbl_revenue_code 
FROM
(
	SELECT STG.rev_code, STG.[description], 'U' AS FLAG 
	FROM [stg].[tbl_revenue_codes] STG
	JOIN [map].[tbl_revenue_codes] MAP
	ON STG.rev_code = MAP.rev_code  
) T

UPDATE MAP
SET MAP.[description] = TMP.[description], [rec_updated_timestamp] = GETDATE(), [rec_status] = 1 
FROM [map].[tbl_revenue_codes]  MAP INNER JOIN tmp_tbl_revenue_code TMP 
ON TMP.rev_code = MAP.rev_code

SET @UPDATE_COUNT=@@ROWCOUNT;
 
--- IDENTIFY IF RECORD IS NEW THEN PERFORM INSERT 

DROP TABLE IF EXISTS tmp_tbl_revenue_code;

SELECT *
INTO tmp_tbl_revenue_code 
FROM
(
	SELECT STG.rev_code, STG.[description], 'I' AS FLAG 
	FROM [stg].[tbl_revenue_codes] STG
	LEFT JOIN [map].[tbl_revenue_codes] MAP
	ON STG.rev_code = MAP.rev_code 
	WHERE MAP.rev_code IS NULL 
) T

INSERT INTO [map].[tbl_revenue_codes]
           ([rev_code]
           ,[description]
           ,[run_instance_skey]
           ,[source_file_skey]
           ,[rec_inserted_timestamp]
           ,[rec_updated_timestamp]
           ,[rec_status])
     SELECT 
			[rev_code]
           ,[description]
		   , NULL
		   , NULL
		   , GETDATE()
		   , GETDATE()
		   , 1								--- ACTIVE RECORD 
FROM 
		tmp_tbl_revenue_code

SET @INSERT_COUNT=@@ROWCOUNT;
SET @LOAD_END_TIME = GETDATE()
SET @STATUS=1
SET @MESSAGE = 'SUCCESS' 

--- LOG PROCESS

INSERT INTO [audit].[audit_job_process_execution_log]
           ([run_instance_skey]
           ,[stage_skey]
           ,[pipeline_skey]
           ,[process_type]
		   ,[process_name]
           ,[source_name]
           ,[destination_name]
           ,[source_row_count]
           ,[destination_row_count]
           ,[rejection_count]
           ,[duplicate_count]
           ,[insert_count]
           ,[update_count]
           ,[delete_count]
           ,[file_processed_flag]
           ,[load_status]
		   ,[message]
           ,[load_start_time]
           ,[load_end_time])
     SELECT 
           1,
           20,
           11,
           'STORED PROCEDURE'
		   ,'[stg].[USP_LOAD_REVENUE_CODE]'
           ,'[stg].[tbl_revenue_codes]'
           ,'[map].[tbl_revenue_codes]'
           ,@SOURCE_COUNT
           ,@DESTINATION_COUNT
           , NULL
           ,NULL
           ,@INSERT_COUNT
           ,@UPDATE_COUNT
           ,NULL
           ,'Y'
           ,'SUCCESS'
		   ,'PROCEDURE EXECUTED SUCCESSFULLY'
           ,@LOAD_START_TIME
           ,@LOAD_END_TIME 


 COMMIT TRANSACTION

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION

SELECT @UPDATE_COUNT=0,@INSERT_COUNT=0, @DELETE_COUNT=0

SET @STATUS=0   ---SETTING THE STATUS OF FAILURE
SET @MESSAGE=ERROR_MESSAGE()
   
-----UPDATE IN EXECUTION LOG THE ERROR MSG WHICH IS RUNNING-----

INSERT INTO [audit].[audit_job_process_execution_log]
           ([run_instance_skey]
           ,[stage_skey]
           ,[pipeline_skey]
           ,[process_type]
		   ,[process_name]
           ,[source_name]
           ,[destination_name]
           ,[source_row_count]
           ,[destination_row_count]
           ,[rejection_count]
           ,[duplicate_count]
           ,[insert_count]
           ,[update_count]
           ,[delete_count]
           ,[file_processed_flag]
           ,[load_status]
		   ,[message]
           ,[load_start_time]
           ,[load_end_time])
     SELECT 
           1,
           20,
           11,
           'STORED PROCEDURE'
		   ,'[stg].[USP_LOAD_REVENUE_CODE]'
           ,'[stg].[tbl_revenue_codes]'
           ,'[map].[tbl_revenue_codes]'
           ,@SOURCE_COUNT
           ,@DESTINATION_COUNT
           , NULL
           ,NULL
           ,@INSERT_COUNT
           ,@UPDATE_COUNT
           ,NULL
           ,'N'
           ,'FAILURE'
		   ,@MESSAGE
           ,@LOAD_START_TIME
           ,@LOAD_END_TIME 

END CATCH

END

