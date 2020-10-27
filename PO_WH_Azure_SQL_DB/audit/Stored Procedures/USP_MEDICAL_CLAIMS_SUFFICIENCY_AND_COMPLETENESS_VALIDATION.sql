

CREATE PROCEDURE [audit].[USP_MEDICAL_CLAIMS_SUFFICIENCY_AND_COMPLETENESS_VALIDATION] 
--------DECLARE PARAMETERS WHICH ARE PASSED FROM/TO ADF PIPELINES------------- 
  @Field_Name VARCHAR(100),
  @Client varchar(100),
  @Carrier varchar(100),
  @source_file_name VARCHAR(100),
  @source_file_type VARCHAR(100),
  @AccountID int,
  @Month VARCHAR(100),
  @Year VARCHAR(100)
as 
    BEGIN 
        ---DECLARE VARIABLES--- 
        DECLARE @V_Status              int; 
        DECLARE @V_Comment             VARCHAR(100); 
        DECLARE @V_Required            VARCHAR(100); 
        DECLARE @V_Present             int; 
        DECLARE @V_Min_Percent_of_Rows VARCHAR(100); 
        DECLARE @V_Max_Percent_of_Rows VARCHAR(100); 
        DECLARE @V_Percent_of_Rows     int; 
        DECLARE @V_Within_Range        int;
        DECLARE @V_Length_within_Range int;
        DECLARE @V_length              VARCHAR(10);
        DECLARE @V_min_length          int;    
        DECLARE @V_max_length          int;
		DECLARE @V_actual_max_length   int;


            SET @V_Required = 
                ( 
                SELECT [required?] 
               FROM   m.tbl_claims_sufficiency_and_completeness 
               WHERE  field_name = @Field_Name
                ) 
            SET @V_Percent_of_Rows = 
                ( 
               SELECT CONVERT(DOUBLE PRECISION, round(100.0 * sum( 
                      CASE 
                             WHEN @Field_Name IS NOT NULL THEN 1 
                             ELSE 0 
                      END) / count(*),2)) AS Field_Name 
               FROM   land.tbl_medical_claim where Account_Number  = @AccountID
                )
            
            SET @V_length = 
                (
                    SELECT [length] 
                    FROM m.tbl_claims_sufficiency_and_completeness 
                    WHERE [field_name] = @Field_Name
                )
		   SET @V_Max_Percent_of_Rows = 
                (
                    SELECT [Max_%_of_Rows_that_should_have_this_element]
                    FROM m.tbl_claims_sufficiency_and_completeness 
                    WHERE [field_name] = @Field_Name
                )
			SET @V_Min_Percent_of_Rows = 
                (
                    SELECT [Min_%_of_Rows_that_should_have_this_element]
                    FROM m.tbl_claims_sufficiency_and_completeness 
                    WHERE [field_name] = @Field_Name
                )
		    
		    
            IF(@V_Required = 'R') 
                BEGIN
                IF(@V_Percent_of_Rows >= 
		    		( 
		    		SELECT [Min_%_of_Rows_that_should_have_this_element] 
		    		FROM   m.tbl_claims_sufficiency_and_completeness 
		    		WHERE  field_name = @Field_Name 
                    ))
                    BEGIN 
		    				SET @V_Within_Range = 1 
		    				SELECT @V_Within_Range AS within_range_status 
                    IF(@V_Percent_of_Rows <= 
		    						( 
		    						SELECT [Max_%_of_Rows_that_should_have_this_element] 
		    						FROM   m.tbl_claims_sufficiency_and_completeness 
		    						WHERE  field_name = @Field_Name
		    						)
                        )
                        BEGIN 
		    						SET @V_Present = 1; 
		    						SELECT @V_Within_Range AS within_range_status;
                                    SET @V_Comment = 'Row% availability fall in range';
                                    SELECT @V_Comment;
                        END
                    ELSE
                        BEGIN
		    						SET @V_Within_Range = 0 
		    						SELECT @V_Within_Range AS within_range_status
		    						SET @V_Comment = CONCAT('Row% availability exceeds the max threshhold',@V_Percent_of_Rows,'In place of',@V_Max_Percent_of_Rows)
                                    SELECT @V_Comment;
                        END
                    END
                ELSE
                    BEGIN 
                        SET @V_Within_Range = 0 
                        SELECT @V_Within_Range AS within_range_status
                        SET @V_Comment = CONCAT('Row% availability lesser than the minimum threshold ',@V_Percent_of_Rows,' in place of ',@V_Min_Percent_of_Rows)
                        SELECT @V_Comment
                    END                
            END
		    BEGIN
		    	IF(CAST(@V_length as varchar) = 'Varies')
                    BEGIN
                        SET @V_Length_within_Range = 1;
                        SELECT @V_Length_within_Range as Length_Range_Status1
		    			
		    		END
		    	ELSE
		    		BEGIN
		    		SET @V_min_length = (SELECT TOP(1) [value] FROM STRING_SPLIT(@V_length,'-'))
		    		SET @V_max_length = (SELECT TOP(1)[value] FROM STRING_SPLIT(@V_length,'-') ORDER BY [value] DESC) 
		    		IF(@V_actual_max_length <= @V_max_length AND @V_actual_max_length >= @V_min_length)
		    			BEGIN
		    			SET @V_Length_within_Range = 1;
		    			SELECT @V_Length_within_Range as Length_Range_Status2
		    			END
		    			ELSE
		    				BEGIN
		    					SET @V_Length_within_Range = 0;
		    					SELECT @V_Length_within_Range as Length_Range_Status3
		    					SELECT @V_length,@V_actual_max_length,@V_min_length,@V_max_length
		    					END
		    				END
		    		END
					IF(@V_Required = 'R') 
			    	    		BEGIN
			    	    			INSERT INTO [audit].[tbl_log_sufficiency_and_completeness] (source_file_name,source_file_type,Carrier,Client,column_header,required,message,year,month,date_inserted_time)  
			    	    			VALUES (@source_file_name,@source_file_type,@Carrier,@Client,@Field_Name,@V_Required,@V_Comment,@Year,@Month,GETDATE())
			    	    		END
		
			    
		    	 
	END 






