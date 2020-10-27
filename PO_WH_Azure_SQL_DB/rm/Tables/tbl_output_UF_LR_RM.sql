﻿CREATE TABLE [rm].[tbl_output_UF_LR_RM] (
    [Member_ID]          VARCHAR (255) NOT NULL,
    [AGE_1]              BIT           NULL,
    [AGE_2]              BIT           NULL,
    [AGE_3]              BIT           NULL,
    [AGE_4]              BIT           NULL,
    [AGE_5]              BIT           NULL,
    [AGE_6]              BIT           NULL,
    [AGE_7]              BIT           NULL,
    [AGE_8]              BIT           NULL,
    [DX_C541]            BIT           NULL,
    [DX_D250]            BIT           NULL,
    [DX_D251]            BIT           NULL,
    [DX_D252]            BIT           NULL,
    [DX_D259]            BIT           NULL,
    [DX_N800]            BIT           NULL,
    [DX_N812]            BIT           NULL,
    [DX_N813]            BIT           NULL,
    [DX_N814]            BIT           NULL,
    [DX_N8502]           BIT           NULL,
    [CHLAMYDIA]          BIT           NULL,
    [GONORR]             BIT           NULL,
    [HPV]                BIT           NULL,
    [BIOPSY]             BIT           NULL,
    [ULTRASOUND]         BIT           NULL,
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
    [SURGERY]            VARCHAR (28)  NULL,
    [confidence_0]       FLOAT (53)    NULL,
    [confidence_1]       FLOAT (53)    NULL,
    [prediction_SURGERY] BIT           NULL,
    [Seq_ID]             INT           IDENTITY (1, 1) NOT NULL,
    [Rec_Insert_Dt]      DATETIME      DEFAULT (getdate()) NOT NULL,
    [Rec_Update_Dt]      DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([Member_ID] ASC)
);

