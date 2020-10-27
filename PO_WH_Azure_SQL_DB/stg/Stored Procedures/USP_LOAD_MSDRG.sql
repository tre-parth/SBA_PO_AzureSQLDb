
--DROP PROCEDURE IF EXISTS [stg].[USP_LOAD_MSDRG]


CREATE PROCEDURE [stg].[USP_LOAD_MSDRG]
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
 --> INCREMENTAL LOAD BASED ON 'LOAD_MSDRG'


 CHANGE LOG:


 CHANGE_ID  DATE                AUTHOR                    CHANGE


 1            AUG 26, 2020        ASHISH AGARWAL        INITIAL VERSION 


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


 SELECT  @SOURCE_COUNT = COUNT(*) FROM [stg].tbl_msdrg

 

 SELECT  @DESTINATION_COUNT = COUNT(*) FROM map.tbl_msdrg
 

 --- IDENTIFY IF RECORD EXISTS THEN PERFORM UPDATE 
 

DROP TABLE IF EXISTS #tmp_msdrg_1
 

SELECT *
INTO #tmp_msdrg_1
FROM
(
    SELECT STG.ms_drg, STG.mdc,STG.Type,STG.ms_drg_title,'U' AS FLAG 
    FROM [stg].[tbl_msdrg] STG
    JOIN [map].[tbl_msdrg] MAP
    ON STG.ms_drg = MAP.ms_drg  
) T

 
UPDATE MAP
SET MAP.[ms_drg_title] = TMP.[ms_drg_title],MAP.[msdrg_updated_timestamp] = GETDATE(), MAP.[msdrg_status] = 1 
FROM [map].[tbl_msdrg]  MAP INNER JOIN #tmp_msdrg_1 TMP 
ON TMP.ms_drg = MAP.ms_drg
 

SET @UPDATE_COUNT=@@ROWCOUNT;


--- IDENTIFY IF RECORD IS NEW THEN PERFORM INSERT 


DROP TABLE IF EXISTS #tmp_msdrg_2


SELECT *
INTO #tmp_msdrg_2
FROM
(
    SELECT stg.ms_drg, stg.mdc, stg.Type,stg.ms_drg_title,'I' AS FLAG 
    FROM [stg].[tbl_msdrg] STG
    LEFT JOIN [map].[tbl_msdrg] MAP
    ON stg.ms_drg = map.ms_drg 
    WHERE map.ms_drg IS NULL 
) T

INSERT INTO [map].[tbl_msdrg]
           ([ms_drg]
            ,mdc
            ,Type
           ,ms_drg_title
           ,[run_instance_skey]
           ,[source_file_skey]
           ,msdrg_inserted_timestamp
           ,msdrg_updated_timestamp
           ,msdrg_status)
     SELECT 
            [ms_drg]
            ,mdc
            ,Type
            ,ms_drg_title
           , NULL
           , NULL
           , GETDATE()
           , GETDATE()
           , 1                                --- ACTIVE RECORD 
FROM 
        #tmp_msdrg_2

 
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
           50,
           11,
           'STORED PROCEDURE'
           ,'[stg].[USP_LOAD_MSDRG]'
           ,'[stg].[tbl_msdrg]'
           ,'[map].[tbl_msdrg]'
           ,@SOURCE_COUNT
           ,@DESTINATION_COUNT
           ,NULL
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
           50,
           11,
           'STORED PROCEDURE'
           ,'[stg].[USP_LOAD_MSDRG]'
           ,'[stg].[tbl_msdrg]'
           ,'[map].[tbl_msdrg]'
           ,@SOURCE_COUNT
           ,@DESTINATION_COUNT
           , NULL
           ,NULL
           ,@INSERT_COUNT
           ,@UPDATE_COUNT
           ,NULL
           ,'N'
           ,'FAILED'
           ,'PROCEDURE EXECUTION FAILED'
           ,@LOAD_START_TIME
           ,@LOAD_END_TIME 

 
END CATCH

END