CREATE TABLE [m].[tbl_claims_sufficiency_and_completeness] (
    [S.No.]                                       INT           IDENTITY (1, 1) NOT NULL,
    [field_name]                                  VARCHAR (300) NOT NULL,
    [data_type]                                   VARCHAR (50)  NOT NULL,
    [length]                                      VARCHAR (20)  NOT NULL,
    [Min_%_of_Rows_that_should_have_this_element] INT           NULL,
    [Max_%_of_Rows_that_should_have_this_element] INT           NULL,
    [required?]                                   VARCHAR (100) NOT NULL,
    [Date_Inserted]                               DATETIME      CONSTRAINT [DF_tbl_claims_sufficiency_and_completeness_Date_Inserted] DEFAULT (getdate()) NULL,
    [Date_Updated]                                DATETIME      CONSTRAINT [DF_tbl_claims_sufficiency_and_completeness_Date_Updated] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tbl_claims_sufficiency_and_completeness] PRIMARY KEY CLUSTERED ([S.No.] ASC)
);

