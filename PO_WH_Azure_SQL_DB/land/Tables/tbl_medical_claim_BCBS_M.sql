﻿CREATE TABLE [land].[tbl_medical_claim_BCBS_M] (
    [RECORD_TYPE]                          VARCHAR (MAX) NULL,
    [CUSTOMER_ID]                          VARCHAR (MAX) NULL,
    [CARRIER_ID]                           VARCHAR (MAX) NULL,
    [GROUP_SEG_ID]                         VARCHAR (MAX) NULL,
    [GROUP_NUMBER]                         VARCHAR (MAX) NULL,
    [SEGMENT_CODE]                         VARCHAR (MAX) NULL,
    [GROUP_NAME]                           VARCHAR (MAX) NULL,
    [SUBSCRIBER_NATIONAL_PLAN]             VARCHAR (MAX) NULL,
    [NASCO_PLAN_CODE]                      VARCHAR (MAX) NULL,
    [HOST_PLAN_CODE]                       VARCHAR (MAX) NULL,
    [SUBSCRIBER_NATIONAL_PACKAGE_CODE]     VARCHAR (MAX) NULL,
    [SOURCE_SYSTEM_CODE]                   VARCHAR (MAX) NULL,
    [CONTRACT_NUMBER]                      VARCHAR (MAX) NULL,
    [CLAIM_NUMBER]                         VARCHAR (MAX) NULL,
    [LINE_NUMBER]                          VARCHAR (MAX) NULL,
    [CLAIM_CONTROL_NUMBER]                 VARCHAR (MAX) NULL,
    [SUBSCRIBER_SSN]                       VARCHAR (MAX) NULL,
    [SUBSCRIBER_FIRST_NAME]                VARCHAR (MAX) NULL,
    [SUBSCRIBER_MIDDLE_INITIAL]            VARCHAR (MAX) NULL,
    [SUBSCRIBER_LAST_NAME]                 VARCHAR (MAX) NULL,
    [SUBSCRIBER_ZIP_CODE]                  VARCHAR (MAX) NULL,
    [HIC_NUMBER]                           VARCHAR (MAX) NULL,
    [MEMBER_ID]                            VARCHAR (MAX) NULL,
    [MEMBER_SSN]                           VARCHAR (MAX) NULL,
    [MEMBER_FIRST_NAME]                    VARCHAR (MAX) NULL,
    [MEMBER_MIDDLE_INITIAL]                VARCHAR (MAX) NULL,
    [MEMBER_LAST_NAME]                     VARCHAR (MAX) NULL,
    [MEMBER_SUFFIX]                        VARCHAR (MAX) NULL,
    [MEMBER_DOB]                           VARCHAR (MAX) NULL,
    [MEMBER_GENDER]                        VARCHAR (MAX) NULL,
    [RELATIONSHIP_TYPE_CODE]               VARCHAR (MAX) NULL,
    [CLAIM_TYPE]                           VARCHAR (MAX) NULL,
    [RECORD_INDICATOR]                     VARCHAR (MAX) NULL,
    [CLAIM_STATUS]                         VARCHAR (MAX) NULL,
    [RECEIPT_DATE]                         VARCHAR (MAX) NULL,
    [PAID_DATE]                            VARCHAR (MAX) NULL,
    [ADJUSTMENT_CODE]                      VARCHAR (MAX) NULL,
    [ADJUSTMENT_REASON_CODE]               VARCHAR (MAX) NULL,
    [ADJUSTMENT_NUMBER]                    VARCHAR (MAX) NULL,
    [SERVICE_START_DATE]                   VARCHAR (MAX) NULL,
    [SERVICE_END_DATE]                     VARCHAR (MAX) NULL,
    [ADMISSION_DATE_KEY]                   VARCHAR (MAX) NULL,
    [DISCHARGE_DATE]                       VARCHAR (MAX) NULL,
    [ACCIDENT_DATE]                        VARCHAR (MAX) NULL,
    [FACILITY_CODE]                        VARCHAR (MAX) NULL,
    [PLACE_OF_SERVICE_CODE]                VARCHAR (MAX) NULL,
    [TYPE_OF_BILL]                         VARCHAR (MAX) NULL,
    [ADMISSION_TYPE_CODE]                  VARCHAR (MAX) NULL,
    [ADMISSION_SOURCE_CODE]                VARCHAR (MAX) NULL,
    [DISCHARGE_STATUS_CODE]                VARCHAR (MAX) NULL,
    [COB_INDICATOR]                        VARCHAR (MAX) NULL,
    [COB_SAVINGS_INDICATOR]                VARCHAR (MAX) NULL,
    [MEDICARE_INDICATOR]                   VARCHAR (MAX) NULL,
    [PRE_AUTHORIZATION_INDICATOR]          VARCHAR (MAX) NULL,
    [EMERGENCY_INDICATOR]                  VARCHAR (MAX) NULL,
    [REFERRAL_INDICATOR]                   VARCHAR (MAX) NULL,
    [NETWORK_PAID_INDICATOR]               VARCHAR (MAX) NULL,
    [NETWORK_PROVIDER_INDICATOR]           VARCHAR (MAX) NULL,
    [IN_OUT_OF_PANEL_INDICATOR]            VARCHAR (MAX) NULL,
    [ADMINISTRATIVE_SERVICE_ONLY_CODE]     VARCHAR (MAX) NULL,
    [PCES_DRG_CD]                          VARCHAR (MAX) NULL,
    [DRG_INDICATOR]                        VARCHAR (MAX) NULL,
    [ICD_VER_CD]                           VARCHAR (MAX) NULL,
    [PRINCIPAL_DIAGNOSIS_CODE]             VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_1]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_2]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_3]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_4]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_5]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_6]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_7]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_8]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_9]                     VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_10]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_11]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_12]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_13]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_14]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_15]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_16]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_17]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_18]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_19]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_20]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_21]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_22]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_23]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_24]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_25]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_26]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_27]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_28]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_29]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_30]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_31]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_32]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_33]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_34]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_35]                    VARCHAR (MAX) NULL,
    [DIAGNOSIS_CODE_36]                    VARCHAR (MAX) NULL,
    [REVENUE_CODE]                         VARCHAR (MAX) NULL,
    [TYPE_OF_SERVICE]                      VARCHAR (MAX) NULL,
    [PROCEDURE_CODE]                       VARCHAR (MAX) NULL,
    [PROCEDURE_MODIFER_CODE_1]             VARCHAR (MAX) NULL,
    [PROCEDURE_MODIFER_CODE_2]             VARCHAR (MAX) NULL,
    [PROCEDURE_MODIFER_CODE_3]             VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_1]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_2]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_3]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_4]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_5]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_6]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_7]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_8]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_9]                 VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_10]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_11]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_12]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_13]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_14]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_15]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_16]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_17]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_18]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_19]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_20]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_21]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_22]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_23]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_24]                VARCHAR (MAX) NULL,
    [ICD_PROCEDURE_CODE_25]                VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_PRINCIPAL]       VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_02]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_03]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_04]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_05]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_06]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_07]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_08]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_09]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_10]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_11]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_12]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_13]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_14]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_15]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_16]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_17]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_18]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_19]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_20]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_21]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_22]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_23]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_24]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_25]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_26]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_27]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_28]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_29]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_30]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_31]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_32]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_33]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_34]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_35]              VARCHAR (MAX) NULL,
    [PRESENT_ON_ADMISSION_36]              VARCHAR (MAX) NULL,
    [UNITS]                                VARCHAR (MAX) NULL,
    [COVERED_DAYS]                         VARCHAR (MAX) NULL,
    [PMT_LIAB_CD]                          VARCHAR (MAX) NULL,
    [BILLED_AMOUNT]                        VARCHAR (MAX) NULL,
    [APPRV_CHG_AMT]                        VARCHAR (MAX) NULL,
    [ALLOWED_AMOUNT]                       VARCHAR (MAX) NULL,
    [SECDY_ALLW_AMT]                       VARCHAR (MAX) NULL,
    [DISCOUNT_AMOUNT]                      VARCHAR (MAX) NULL,
    [GRP_LIAB_AMT]                         VARCHAR (MAX) NULL,
    [PAID_AMOUNT]                          VARCHAR (MAX) NULL,
    [COPAY_AMOUNT]                         VARCHAR (MAX) NULL,
    [COINSURANCE_AMOUNT]                   VARCHAR (MAX) NULL,
    [DEDUCTIBLE_AMOUNT]                    VARCHAR (MAX) NULL,
    [ACCESS_FEE_AMOUNT]                    VARCHAR (MAX) NULL,
    [OTHER_MEMBER_LIABILITY_AMT]           VARCHAR (MAX) NULL,
    [NON_COVERED_CHARGES]                  VARCHAR (MAX) NULL,
    [COB_SAVINGS]                          VARCHAR (MAX) NULL,
    [TOTAL_MEMBER_LIABILITY_AMT]           VARCHAR (MAX) NULL,
    [NS_MCAR_PMT_AMT]                      VARCHAR (MAX) NULL,
    [CHECK_NUMBER]                         VARCHAR (MAX) NULL,
    [SANCTION_CODE_1]                      VARCHAR (MAX) NULL,
    [SANCTION_CODE_2]                      VARCHAR (MAX) NULL,
    [SANCTION_CODE_3]                      VARCHAR (MAX) NULL,
    [SANCTION_CODE_4]                      VARCHAR (MAX) NULL,
    [SANCTION_AMOUNT_1]                    VARCHAR (MAX) NULL,
    [SANCTION_AMOUNT_2]                    VARCHAR (MAX) NULL,
    [SANCTION_AMOUNT_3]                    VARCHAR (MAX) NULL,
    [SANCTION_AMOUNT_4]                    VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_ID]                  VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_TIN]                 VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_TIN_SEQUENCE]        VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_LICENSE_NUM]         VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_NPI_NUM]             VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_FIRST_NAME]          VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_MIDDLE_INITIAL]      VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_LAST_NAME]           VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_ADDRESS1]            VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_ADDRESS2]            VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_CITY]                VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_STATE]               VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_ZIP_CODE]            VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_TYPE]                VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_SPECIALTY]           VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_SUB_SPECIALTY]       VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_CLASSIFICATION_CODE] VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_FORM_OF_PRACTICE]    VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_ORG_NAME]            VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_PHONE_NUM]           VARCHAR (MAX) NULL,
    [SERVICE_PROVIDER_FAX_NUM]             VARCHAR (MAX) NULL,
    [FILLER_25]                            VARCHAR (MAX) NULL,
    [FILLER_26]                            VARCHAR (MAX) NULL,
    [FILLER_27]                            VARCHAR (MAX) NULL,
    [FILLER_28]                            VARCHAR (MAX) NULL,
    [FILLER_29]                            VARCHAR (MAX) NULL,
    [FILLER_30]                            VARCHAR (MAX) NULL,
    [FILLER_31]                            VARCHAR (MAX) NULL,
    [FILLER_32]                            VARCHAR (MAX) NULL,
    [FILLER_33]                            VARCHAR (MAX) NULL,
    [FILLER_34]                            VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_ID]                  VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_TIN]                 VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_LICENSE_NUMBER]      VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_NPI_NUMBER]          VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_FIRST_NAME]          VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_MIDDLE_INITIAL]      VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_LAST_NAME]           VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_ADDRESS1]            VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_ADDRESS2]            VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_CITY]                VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_STATE]               VARCHAR (MAX) NULL,
    [BILLING_PROVIDER_ZIP_CODE]            VARCHAR (MAX) NULL,
    [REFERRING_PROVIDER_ID]                VARCHAR (MAX) NULL,
    [REFERRING_PROVIDER_FORM_OF_PRACTICE]  VARCHAR (MAX) NULL,
    [ATTENDING_PROVIDER_ID]                VARCHAR (MAX) NULL,
    [DISPOSITION_CODE_1]                   VARCHAR (MAX) NULL,
    [DISPOSITION_CODE_2]                   VARCHAR (MAX) NULL,
    [RBB_QUALIFIER_CD ]                    VARCHAR (MAX) NULL,
    [RBB_TREATMENT_CAT_CD]                 VARCHAR (MAX) NULL,
    [RBB_LN_BNDL_IND]                      VARCHAR (MAX) NULL,
    [RBB_MAX_BENE_ALWD_AMT]                VARCHAR (MAX) NULL,
    [RBB_EXCESS_AMT]                       VARCHAR (MAX) NULL,
    [RBB_EXCESS_OOP_AMT]                   VARCHAR (MAX) NULL,
    [RBB_OO_POCKET_IND]                    VARCHAR (MAX) NULL,
    [RBB_REMAINING_AMT]                    VARCHAR (MAX) NULL,
    [DRUG_DISPENSE_QUANTITY]               VARCHAR (MAX) NULL,
    [NATIONAL_DRUG_CD]                     VARCHAR (MAX) NULL,
    [BENEFIT_PACKAGE_ID]                   VARCHAR (MAX) NULL,
    [TIER_LEVEL_CODE]                      VARCHAR (MAX) NULL,
    [ITS_SUPPLEMENTAL_AMT]                 VARCHAR (MAX) NULL,
    [WTHHOLD_AMOUNT]                       VARCHAR (MAX) NULL,
    [BENEFIT_NETWORK_CD]                   VARCHAR (MAX) NULL,
    [REPORTED_DRG_CD]                      VARCHAR (MAX) NULL,
    [CMS_CONTRACT_NUM]                     VARCHAR (MAX) NULL,
    [OPAYR_PAID_AMT]                       VARCHAR (MAX) NULL,
    [TRANSACTION_TYPE_CD]                  VARCHAR (MAX) NULL,
    [MEDICARE_LICENSE_NUM]                 VARCHAR (MAX) NULL,
    [SRVLN_STATUS_CD]                      VARCHAR (MAX) NULL,
    [MEDICARE_PMT_AMT]                     VARCHAR (MAX) NULL,
    [MEDICARE_ALB_AMT]                     VARCHAR (MAX) NULL,
    [MEDICARE_CINS_AMT]                    VARCHAR (MAX) NULL,
    [MEDICARE_DED_AMT]                     VARCHAR (MAX) NULL,
    [NETWORK_CD]                           VARCHAR (MAX) NULL,
    [ADMISSION_DGN_CD]                     VARCHAR (MAX) NULL,
    [MI_TAX_AMT]                           VARCHAR (MAX) NULL,
    [ADDITIONAL_ADMIN_COST]                VARCHAR (MAX) NULL,
    [FILLER_1]                             VARCHAR (MAX) NULL,
    [FILLER_2]                             VARCHAR (MAX) NULL,
    [FILLER_3]                             VARCHAR (MAX) NULL,
    [FILLER_4]                             VARCHAR (MAX) NULL,
    [FILLER_5]                             VARCHAR (MAX) NULL,
    [FILLER_6]                             VARCHAR (MAX) NULL,
    [FILLER_7]                             VARCHAR (MAX) NULL,
    [FILLER_8]                             VARCHAR (MAX) NULL,
    [FILLER_9]                             VARCHAR (MAX) NULL,
    [FILLER_10]                            VARCHAR (MAX) NULL,
    [FILLER_11]                            VARCHAR (MAX) NULL,
    [FILLER_12]                            VARCHAR (MAX) NULL,
    [FILLER_13]                            VARCHAR (MAX) NULL,
    [FILLER_14]                            VARCHAR (MAX) NULL,
    [FILLER_15]                            VARCHAR (MAX) NULL,
    [FILLER_16]                            VARCHAR (MAX) NULL,
    [FILLER_17]                            VARCHAR (MAX) NULL,
    [FILLER_18]                            VARCHAR (MAX) NULL,
    [FILLER_19]                            VARCHAR (MAX) NULL,
    [FILLER_20]                            VARCHAR (MAX) NULL,
    [FILLER_21]                            VARCHAR (MAX) NULL,
    [FILLER_22]                            VARCHAR (MAX) NULL,
    [FILLER_23]                            VARCHAR (MAX) NULL,
    [FILLER_24]                            VARCHAR (MAX) NULL
);
