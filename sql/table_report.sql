create table `blood` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `blood` ADD PRIMARY KEY (reportId);
ALTER TABLE `blood` ADD COLUMN PDW decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN PCT decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN MCHC decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN MCV decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN RDW_CV decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN MCH decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN MPV decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN RDW_SD decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN WBC decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN RBC decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN PLT decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN Hb decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN HCT decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN NE_P decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN NE_V decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN LY_P decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN LY_V decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN MO_P decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN MO_V decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN EO_P decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN EO_V decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN BA_P decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN BA_V decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN LCR decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN P_LCR decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN Hb_M decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN RCT decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN RBC_M decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN RBC_F decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN Hb_F decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN RDW decimal(8, 4);
ALTER TABLE `blood` ADD COLUMN clientId varchar(32);

create table `chemical` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `chemical` ADD PRIMARY KEY (reportId);
ALTER TABLE `chemical` ADD COLUMN T_BIL decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN TP decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN FPG decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN AdevG decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN ALT decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN AST decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN ASTdevALT decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN GGT decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN ALP decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN ALB decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN GLB decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN D_BIL decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN I_BIL decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN TCHOL decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN TGIG decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN HDL_CH decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN LDL_CH decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Urea decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN UA decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Crea decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Apo_B decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN ApoAIdevApoB decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN ApoAI decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Hcy decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN CK decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN LDH decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN CK_MB decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN hsCRP decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN BUN decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Cys_C decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN BN_P decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN HbA1C decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN CIV decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN LN decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN pcⅢ decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN HA decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN HBDH decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN IgA decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN IgG decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN IgM decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN C4 decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Cl decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Na decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN K decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN C3 decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN TBA decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Lp_a decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN FER_Che decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Vtm_B12 decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN FOL decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN P decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Ca decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Mg decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN PRA decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN AT_i decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN AT_ii decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN TRF decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN INS_Ab varchar(10);
ALTER TABLE `chemical` ADD COLUMN ICA varchar(10);
ALTER TABLE `chemical` ADD COLUMN GAD_Ab varchar(10);
ALTER TABLE `chemical` ADD COLUMN INS0 decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Tro_T decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN MYO decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN AMY decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN C_P decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN D_Dim decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN TIBC decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN Tfs decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN AFP_Che decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN CEA_Che decimal(8, 4);
ALTER TABLE `chemical` ADD COLUMN IAA varchar(10);
ALTER TABLE `chemical` ADD COLUMN clientId varchar(32)

create table `general` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `general` ADD PRIMARY KEY (reportId);
ALTER TABLE `general` ADD COLUMN PLS decimal(8, 4);
ALTER TABLE `general` ADD COLUMN WGT decimal(8, 4);
ALTER TABLE `general` ADD COLUMN HGT decimal(8, 4);
ALTER TABLE `general` ADD COLUMN SBP_R varchar(10);
ALTER TABLE `general` ADD COLUMN BMI decimal(8, 4);
ALTER TABLE `general` ADD COLUMN DBP_R varchar(10);
ALTER TABLE `general` ADD COLUMN DBP decimal(8, 4);
ALTER TABLE `general` ADD COLUMN SBP decimal(8, 4);
ALTER TABLE `general` ADD COLUMN DBP_R2 varchar(10);
ALTER TABLE `general` ADD COLUMN SBP_R2 varchar(10);
ALTER TABLE `general` ADD COLUMN WST_M decimal(8, 4);
ALTER TABLE `general` ADD COLUMN BUT varchar(10);
ALTER TABLE `general` ADD COLUMN WdevB varchar(10);
ALTER TABLE `general` ADD COLUMN BT decimal(8, 4);
ALTER TABLE `general` ADD COLUMN BRT decimal(8, 4);
ALTER TABLE `general` ADD COLUMN NTR varchar(10);
ALTER TABLE `general` ADD COLUMN DEV varchar(10);
ALTER TABLE `general` ADD COLUMN BF varchar(10);
ALTER TABLE `general` ADD COLUMN BFR varchar(10);
ALTER TABLE `general` ADD COLUMN BWR varchar(10);
ALTER TABLE `general` ADD COLUMN MTB varchar(10);
ALTER TABLE `general` ADD COLUMN Be_F varchar(10);
ALTER TABLE `general` ADD COLUMN NTF varchar(10);
ALTER TABLE `general` ADD COLUMN WST_F decimal(8, 4);
ALTER TABLE `general` ADD COLUMN clientId varchar(32)

create table `heart` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `heart` ADD PRIMARY KEY (reportId);
ALTER TABLE `heart` ADD COLUMN RHR decimal(8, 4);
ALTER TABLE `heart` ADD COLUMN QRS_WC decimal(8, 4);
ALTER TABLE `heart` ADD COLUMN P_RI decimal(8, 4);
ALTER TABLE `heart` ADD COLUMN Q_TI decimal(8, 4);
ALTER TABLE `heart` ADD COLUMN QTc decimal(8, 4);
ALTER TABLE `heart` ADD COLUMN CEA decimal(8, 4);
ALTER TABLE `heart` ADD COLUMN ECG varchar(10);
ALTER TABLE `heart` ADD COLUMN BBB varchar(10);
ALTER TABLE `heart` ADD COLUMN SR varchar(10);
ALTER TABLE `heart` ADD COLUMN AMI varchar(10);
ALTER TABLE `heart` ADD COLUMN CEP varchar(10);
ALTER TABLE `heart` ADD COLUMN STT varchar(10);
ALTER TABLE `heart` ADD COLUMN AJR varchar(10);
ALTER TABLE `heart` ADD COLUMN CAR varchar(10);
ALTER TABLE `heart` ADD COLUMN VEB varchar(10);
ALTER TABLE `heart` ADD COLUMN SAB varchar(10);
ALTER TABLE `heart` ADD COLUMN AB varchar(10);
ALTER TABLE `heart` ADD COLUMN U_W varchar(10);
ALTER TABLE `heart` ADD COLUMN WPW varchar(10);
ALTER TABLE `heart` ADD COLUMN ETC varchar(10);
ALTER TABLE `heart` ADD COLUMN A_V varchar(10);
ALTER TABLE `heart` ADD COLUMN clientId varchar(32)

create table `report_thyroid` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `report_thyroid` ADD PRIMARY KEY (reportId);
ALTER TABLE `report_thyroid` ADD COLUMN THY_Detail varchar(500);
ALTER TABLE `report_thyroid` ADD COLUMN clientId varchar(32);

create table `report_tumour` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `report_tumour` ADD PRIMARY KEY (reportId);
ALTER TABLE `report_tumour` ADD COLUMN CEA decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN AFP decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN CA125 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN F_PSA decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN CA199 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN T_PSA decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN F_PSAdevT_PSA decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN CA153 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN CYF211 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN SCC decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN CA242 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN CA724 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN FER decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN G17 varchar(10);
ALTER TABLE `report_tumour` ADD COLUMN PGII decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN PGI decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN PGIdevPGII decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN CA50 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN NSE decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN PSA decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN TSGF decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN TNF decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN IFN decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN ECS varchar(10);
ALTER TABLE `report_tumour` ADD COLUMN AFP_R varchar(10);
ALTER TABLE `report_tumour` ADD COLUMN CEA_R varchar(10);
ALTER TABLE `report_tumour` ADD COLUMN AFU decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN ProGRP decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN b_HCG decimal(12, 6);
ALTER TABLE `report_tumour` ADD COLUMN CT decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN FIO decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN UIBC decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN NMP22 varchar(10);
ALTER TABLE `report_tumour` ADD COLUMN HE4 decimal(8, 4);
ALTER TABLE `report_tumour` ADD COLUMN EB_IgM varchar(10);
ALTER TABLE `report_tumour` ADD COLUMN clientId varchar(32);


TRUNCATE report_blood;
TRUNCATE report_chemical;
TRUNCATE report_general;
TRUNCATE report_heart;
TRUNCATE report_thyroid;
TRUNCATE report_tumour;

alter table report_thyroid modify column THY_Detail varchar(400);

alter table report_blood character set utf8;