﻿CREATE TABLE [m].[tbl_sf_participation] (
    [company]                       TEXT          NULL,
    [client_last_name]              TEXT          NULL,
    [client_first_name]             TEXT          NULL,
    [rel_to_employee]               VARCHAR (10)  NULL,
    [solucia_id]                    TEXT          NULL,
    [intake_id]                     BIGINT        NULL,
    [client_dob]                    DATE          NULL,
    [client_gender]                 VARCHAR (20)  NULL,
    [home_phone]                    TEXT          NULL,
    [work_phone]                    TEXT          NULL,
    [cell_phone]                    TEXT          NULL,
    [email]                         TEXT          NULL,
    [street_address_1]              TEXT          NULL,
    [street_address_2]              TEXT          NULL,
    [city]                          TEXT          NULL,
    [state]                         VARCHAR (100) NULL,
    [zip_code]                      TEXT          NULL,
    [enrolled_diagnosis]            TEXT          NULL,
    [employee_last_name]            TEXT          NULL,
    [employee_first_name]           TEXT          NULL,
    [referral_source]               TEXT          NULL,
    [integration_partner]           TEXT          NULL,
    [insurance_carrier]             TEXT          NULL,
    [intake_date]                   DATE          NULL,
    [cmr_program_type]              TEXT          NULL,
    [program_sub_type]              TEXT          NULL,
    [pre_opn]                       VARCHAR (10)  NULL,
    [pre_phy]                       VARCHAR (10)  NULL,
    [pre_smo]                       VARCHAR (10)  NULL,
    [pre_mis]                       VARCHAR (10)  NULL,
    [pre_med]                       VARCHAR (10)  NULL,
    [pre_lif]                       VARCHAR (10)  NULL,
    [pre_lip]                       VARCHAR (10)  NULL,
    [pre_ivs]                       VARCHAR (10)  NULL,
    [preintent_surgical_procedure]  TEXT          NULL,
    [postintent_surgical_procedure] TEXT          NULL,
    [survey_completed]              DATETIME      NULL,
    [survey_not_completed]          DATETIME      NULL,
    [survey_result]                 VARCHAR (10)  NULL,
    [year_of_impact]                INT           NULL,
    [a]                             INT           NULL,
    [b]                             INT           NULL,
    [c]                             INT           NULL,
    [d]                             INT           NULL,
    [e]                             INT           NULL,
    [f]                             INT           NULL,
    [g]                             INT           NULL,
    [h]                             INT           NULL,
    [i]                             INT           NULL,
    [j]                             INT           NULL,
    [k]                             INT           NULL,
    [no_impact]                     INT           NULL,
    [impact_status_cmr]             TEXT          NULL,
    [post_med]                      VARCHAR (10)  NULL,
    [post_lif]                      VARCHAR (10)  NULL,
    [post_lip]                      VARCHAR (10)  NULL,
    [post_ivs]                      VARCHAR (10)  NULL,
    [post_mis]                      VARCHAR (10)  NULL,
    [active_flag]                   INT           NOT NULL,
    [source_file_skey]              BIGINT        NOT NULL,
    [run_instance_skey]             BIGINT        NOT NULL,
    [m_inserted_timestamp]          DATETIME      NOT NULL,
    [m_updated_timestamp]           DATETIME      NULL
);

