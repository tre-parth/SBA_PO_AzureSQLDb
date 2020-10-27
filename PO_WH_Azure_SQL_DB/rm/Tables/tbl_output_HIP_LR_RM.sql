﻿CREATE TABLE [rm].[tbl_output_HIP_LR_RM] (
    [AGE_1]              BIT           NULL,
    [AGE_2]              BIT           NULL,
    [AGE_3]              BIT           NULL,
    [AGE_4]              BIT           NULL,
    [AGE_5]              BIT           NULL,
    [AGE_6]              BIT           NULL,
    [AGE_7]              BIT           NULL,
    [AGE_8]              BIT           NULL,
    [DX_M1611]           BIT           NULL,
    [DX_M1612]           BIT           NULL,
    [DX_M169]            BIT           NULL,
    [DX_M1610]           BIT           NULL,
    [DX_Z96641]          BIT           NULL,
    [ASPIRATION]         BIT           NULL,
    [CT_SCAN]            BIT           NULL,
    [MRI]                BIT           NULL,
    [DME]                BIT           NULL,
    [XRAY]               BIT           NULL,
    [CHIRO]              BIT           NULL,
    [ELEC_STIMULATION]   BIT           NULL,
    [THERAPY]            BIT           NULL,
    [AFIB]               BIT           NULL,
    [ALZDEM]             BIT           NULL,
    [AMI]                BIT           NULL,
    [ANEMIA]             BIT           NULL,
    [ASTHMA]             BIT           NULL,
    [BPH]                BIT           NULL,
    [BREAST]             BIT           NULL,
    [CATARACT]           BIT           NULL,
    [CKD]                BIT           NULL,
    [COLORECTAL]         BIT           NULL,
    [COPD]               BIT           NULL,
    [DEPRESSION]         BIT           NULL,
    [DM1]                BIT           NULL,
    [DM2]                BIT           NULL,
    [ENDOMETRIAL]        BIT           NULL,
    [GLAUCOMA]           BIT           NULL,
    [HF]                 BIT           NULL,
    [HIPFRAC]            BIT           NULL,
    [HTN]                BIT           NULL,
    [HYPLIP]             BIT           NULL,
    [HYPOTHYROIDISM]     BIT           NULL,
    [IHD]                BIT           NULL,
    [LUNG]               BIT           NULL,
    [OST]                BIT           NULL,
    [PROSTATE]           BIT           NULL,
    [RAOA]               BIT           NULL,
    [STROKE]             BIT           NULL,
    [FEMALE]             BIT           NULL,
    [Member_ID]          VARCHAR (128) NULL,
    [SURGERY]            VARCHAR (28)  NULL,
    [confidence_0]       FLOAT (53)    NULL,
    [confidence_1]       FLOAT (53)    NULL,
    [prediction_SURGERY] BIT           NULL,
    [Seq_ID]             INT           IDENTITY (1, 1) NOT NULL,
    [Rec_Insert_Dt]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [Rec_Update_Dt]      DATETIME      DEFAULT (getdate()) NOT NULL
);

