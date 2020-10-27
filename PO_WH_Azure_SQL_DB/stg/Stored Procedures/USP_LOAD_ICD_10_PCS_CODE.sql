﻿

--DROP PROCEDURE IF EXISTS [stg].[USP_LOAD_ICD_10_PCS_CODE]

CREATE PROCEDURE [stg].[USP_LOAD_ICD_10_PCS_CODE]
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
 --> INCREMENTAL LOAD BASED ON 'ICD_10_PCS_CODE' 


 CHANGE LOG:

 CHANGE_ID  DATE				AUTHOR					CHANGE

 1			AUG 26, 2020		ASHISH AGARWAL		INITIAL VERSION 

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

 SELECT  @SOURCE_COUNT = COUNT(*) FROM [stg].[tbl_icd_10_pcs]

 SELECT  @DESTINATION_COUNT = COUNT(*) FROM [map].[tbl_icd_10_pcs]

 --- IDENTIFY IF RECORD EXISTS THEN PERFORM UPDATE 

DROP TABLE IF EXISTS tmp_tbl_icd_10_pcs_code;

SELECT *
INTO tmp_tbl_icd_10_pcs_code 
FROM
(
	SELECT STG.icd_10_pcs_code, STG.[description], 'U' AS FLAG 
	FROM [stg].[tbl_icd_10_pcs] STG
	JOIN [map].[tbl_icd_10_pcs] MAP
	ON STG.icd_10_pcs_code = MAP.icd_10_pcs_code  
) T

UPDATE MAP
SET MAP.[description] = TMP.[description], [icd_10_updated_timestamp] = GETDATE(), [icd_status] = 1 
FROM [map].[tbl_icd_10_pcs]  MAP INNER JOIN tmp_tbl_icd_10_pcs_code TMP 
ON TMP.icd_10_pcs_code = MAP.icd_10_pcs_code

SET @UPDATE_COUNT=@@ROWCOUNT;


--- IDENTIFY IF RECORD IS NEW THEN PERFORM INSERT 

DROP TABLE IF EXISTS tmp_tbl_icd_10_pcs_code;

SELECT *
INTO tmp_tbl_icd_10_pcs_code 
FROM
(
	SELECT STG.icd_10_pcs_code, STG.[description], 'I' AS FLAG 
	FROM [stg].[tbl_icd_10_pcs] STG
	LEFT JOIN [map].[tbl_icd_10_pcs] MAP
	ON STG.icd_10_pcs_code = MAP.icd_10_pcs_code 
	WHERE MAP.icd_10_pcs_code IS NULL 
) T

INSERT INTO [map].[tbl_icd_10_pcs]
           ([icd_10_pcs_code]
           ,[description]
           ,[run_instance_skey]
           ,[source_file_skey]
           ,[icd_10_pcs_inserted_timestamp]
           ,[icd_10_pcs_updated_timestamp]
           ,[icd_status])
     SELECT 
			[icd_10_pcs_code]
           ,[description]
		   , NULL
		   , NULL
		   , GETDATE()
		   , GETDATE()
		   , 1								--- ACTIVE RECORD 
FROM 
		tmp_tbl_icd_10_pcs_code

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
		   ,'[stg].[USP_LOAD_ICD_10_pcs_CODE]'
           ,'[stg].[tbl_icd_10_pcs]'
           ,'[map].[tbl_icd_10_pcs]'
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
           ,'[stg].[USP_LOAD_ICD_10_pcs_CODE]'
           ,'[stg].[tbl_icd_10_pcs]'
           ,'[map].[tbl_icd_10_pcs]'
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
