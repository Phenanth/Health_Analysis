create table `report_blood` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `report_blood` ADD PRIMARY KEY (reportId);
ALTER TABLE `report_blood` ADD COLUMN PDW decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN PCT decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN MCHC decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN MCV decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN RDW_CV decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN MCH decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN MPV decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN RDW_SD decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN WBC decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN RBC decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN PLT decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN Hb decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN HCT decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN NE_P decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN NE_V decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN LY_P decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN LY_V decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN MO_P decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN MO_V decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN EO_P decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN EO_V decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN BA_P decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN BA_V decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN LCR decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN P_LCR decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN Hb_M decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN RCT decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN RBC_M decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN RBC_F decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN Hb_F decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN RDW decimal(8, 4);
ALTER TABLE `report_blood` ADD COLUMN clientId varchar(32);

create table `report_chemical` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `report_chemical` ADD PRIMARY KEY (reportId);
ALTER TABLE `report_chemical` ADD COLUMN T_BIL decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN TP decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN FPG decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN AdevG decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN ALT decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN AST decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN ASTdevALT decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN GGT decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN ALP decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN ALB decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN GLB decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN D_BIL decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN I_BIL decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN TCHOL decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN TGIG decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN HDL_CH decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN LDL_CH decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Urea decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN UA decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Crea decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Apo_B decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN ApoAIdevApoB decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN ApoAI decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Hcy decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN CK decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN LDH decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN CK_MB decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN hsCRP decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN BUN decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Cys_C decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN BN_P decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN HbA1C decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN CIV decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN LN decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN pcⅢ decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN HA decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN HBDH decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN IgA decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN IgG decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN IgM decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN C4 decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Cl decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Na decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN K decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN C3 decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN TBA decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Lp_a decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN FER_Che decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Vtm_B12 decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN FOL decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN P decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Ca decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Mg decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN PRA decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN AT_i decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN AT_ii decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN TRF decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN INS_Ab varchar(10);
ALTER TABLE `report_chemical` ADD COLUMN ICA varchar(10);
ALTER TABLE `report_chemical` ADD COLUMN GAD_Ab varchar(10);
ALTER TABLE `report_chemical` ADD COLUMN INS0 decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Tro_T decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN MYO decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN AMY decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN C_P decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN D_Dim decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN TIBC decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN Tfs decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN AFP_Che decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN CEA_Che decimal(8, 4);
ALTER TABLE `report_chemical` ADD COLUMN IAA varchar(10);
ALTER TABLE `report_chemical` ADD COLUMN clientId varchar(32)

create table `report_general` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `report_general` ADD PRIMARY KEY (reportId);
ALTER TABLE `report_general` ADD COLUMN PLS decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN WGT decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN HGT decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN SBP_R varchar(10);
ALTER TABLE `report_general` ADD COLUMN BMI decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN DBP_R varchar(10);
ALTER TABLE `report_general` ADD COLUMN DBP decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN SBP decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN DBP_R2 varchar(10);
ALTER TABLE `report_general` ADD COLUMN SBP_R2 varchar(10);
ALTER TABLE `report_general` ADD COLUMN WST_M decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN BUT varchar(10);
ALTER TABLE `report_general` ADD COLUMN WdevB varchar(10);
ALTER TABLE `report_general` ADD COLUMN BT decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN BRT decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN NTR varchar(10);
ALTER TABLE `report_general` ADD COLUMN DEV varchar(10);
ALTER TABLE `report_general` ADD COLUMN BF varchar(10);
ALTER TABLE `report_general` ADD COLUMN BFR varchar(10);
ALTER TABLE `report_general` ADD COLUMN BWR varchar(10);
ALTER TABLE `report_general` ADD COLUMN MTB varchar(10);
ALTER TABLE `report_general` ADD COLUMN Be_F varchar(10);
ALTER TABLE `report_general` ADD COLUMN NTF varchar(10);
ALTER TABLE `report_general` ADD COLUMN WST_F decimal(8, 4);
ALTER TABLE `report_general` ADD COLUMN clientId varchar(32)

create table `report_heart` (reportId varchar(32)) ENGINE=InnoDB;
ALTER TABLE `report_heart` ADD PRIMARY KEY (reportId);
ALTER TABLE `report_heart` ADD COLUMN RHR decimal(8, 4);
ALTER TABLE `report_heart` ADD COLUMN QRS_WC varchar(10);
ALTER TABLE `report_heart` ADD COLUMN P_RI varchar(10);
ALTER TABLE `report_heart` ADD COLUMN Q_TI varchar(10);
ALTER TABLE `report_heart` ADD COLUMN QTc decimal(8, 4);
ALTER TABLE `report_heart` ADD COLUMN CEA decimal(8, 4);
ALTER TABLE `report_heart` ADD COLUMN ECG varchar(10);
ALTER TABLE `report_heart` ADD COLUMN BBB varchar(10);
ALTER TABLE `report_heart` ADD COLUMN SR varchar(10);
ALTER TABLE `report_heart` ADD COLUMN AMI varchar(10);
ALTER TABLE `report_heart` ADD COLUMN CEP varchar(10);
ALTER TABLE `report_heart` ADD COLUMN STT varchar(10);
ALTER TABLE `report_heart` ADD COLUMN AJR varchar(10);
ALTER TABLE `report_heart` ADD COLUMN CAR varchar(10);
ALTER TABLE `report_heart` ADD COLUMN VEB varchar(10);
ALTER TABLE `report_heart` ADD COLUMN SAB varchar(10);
ALTER TABLE `report_heart` ADD COLUMN AB varchar(10);
ALTER TABLE `report_heart` ADD COLUMN U_W varchar(10);
ALTER TABLE `report_heart` ADD COLUMN WPW varchar(10);
ALTER TABLE `report_heart` ADD COLUMN ETC varchar(10);
ALTER TABLE `report_heart` ADD COLUMN A_V varchar(10);
ALTER TABLE `report_heart` ADD COLUMN clientId varchar(32)

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

select distinct scientificName, genre, minValue, maxValue, property from list_static, list_index
where list_static.scientificName = list_index.scientificName group by scientificName;


# 数据修改

## 清空表
TRUNCATE report_report_blood;
TRUNCATE report_report_chemical;
TRUNCATE report_report_general;
TRUNCATE report_report_heart;
TRUNCATE report_thyroid;
TRUNCATE report_tumour;

## 更新列值
update list_static set maxValue = 23.99 where scientificName="BMI";
update report_thyroid set numAbnormal = 0;

# 表修改

## 添加列
alter table report_thyroid add column numAbnormal decimal(2);

## 更改列数据类型
alter table report_report_blood modify column PCT decimal(12, 6);

## 修改列名
alter table report_heart change CEA CEA_Hrt decimal(8,4);

## 设置表字符库，更改列数据存储形式
alter table report_report_blood character set utf8;
alter table report_report_chemical modify column ALB varchar(15) character set utf8mb4 collate utf8mb4_unicode_ci;

## 总表创建
CREATE TABLE `report_total` (
  `reportId` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `clientId` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `PDW` decimal(8,4) DEFAULT NULL,
  `PCT` decimal(12,6) DEFAULT NULL,
  `MCHC` decimal(8,4) DEFAULT NULL,
  `MCV` decimal(8,4) DEFAULT NULL,
  `RDW_CV` decimal(8,4) DEFAULT NULL,
  `MCH` decimal(8,4) DEFAULT NULL,
  `MPV` decimal(8,4) DEFAULT NULL,
  `RDW_SD` decimal(8,4) DEFAULT NULL,
  `WBC` decimal(8,4) DEFAULT NULL,
  `RBC` decimal(8,4) DEFAULT NULL,
  `PLT` decimal(8,4) DEFAULT NULL,
  `Hb` decimal(8,4) DEFAULT NULL,
  `HCT` decimal(8,4) DEFAULT NULL,
  `NE_P` decimal(8,4) DEFAULT NULL,
  `NE_V` decimal(8,4) DEFAULT NULL,
  `LY_P` decimal(8,4) DEFAULT NULL,
  `LY_V` decimal(8,4) DEFAULT NULL,
  `MO_P` decimal(8,4) DEFAULT NULL,
  `MO_V` decimal(8,4) DEFAULT NULL,
  `EO_P` decimal(8,4) DEFAULT NULL,
  `EO_V` decimal(8,4) DEFAULT NULL,
  `BA_P` decimal(8,4) DEFAULT NULL,
  `BA_V` decimal(8,4) DEFAULT NULL,
  `LCR` decimal(8,4) DEFAULT NULL,
  `P_LCR` decimal(8,4) DEFAULT NULL,
  `Hb_M` decimal(8,4) DEFAULT NULL,
  `RCT` decimal(8,4) DEFAULT NULL,
  `RBC_M` decimal(8,4) DEFAULT NULL,
  `RBC_F` decimal(8,4) DEFAULT NULL,
  `Hb_F` decimal(8,4) DEFAULT NULL,
  `RDW` decimal(8,4) DEFAULT NULL,
  `T_BIL` decimal(8,4) DEFAULT NULL,
  `TP` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FPG` decimal(8,4) DEFAULT NULL,
  `AdevG` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `ALT` decimal(8,4) DEFAULT NULL,
  `AST` decimal(8,4) DEFAULT NULL,
  `ASTdevALT` decimal(12,6) DEFAULT NULL,
  `GGT` decimal(8,4) DEFAULT NULL,
  `ALP` decimal(8,4) DEFAULT NULL,
  `ALB` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GLB` decimal(12,6) DEFAULT NULL,
  `D_BIL` decimal(8,4) DEFAULT NULL,
  `I_BIL` decimal(8,4) DEFAULT NULL,
  `TCHOL` decimal(12,6) DEFAULT NULL,
  `TGIG` decimal(8,4) DEFAULT NULL,
  `HDL_CH` decimal(8,4) DEFAULT NULL,
  `LDL_CH` decimal(8,4) DEFAULT NULL,
  `Urea` decimal(8,4) DEFAULT NULL,
  `UA` decimal(8,4) DEFAULT NULL,
  `Crea` decimal(8,4) DEFAULT NULL,
  `Apo_B` decimal(8,4) DEFAULT NULL,
  `ApoAIdevApoB` decimal(8,4) DEFAULT NULL,
  `ApoAI` decimal(8,4) DEFAULT NULL,
  `Hcy` decimal(8,4) DEFAULT NULL,
  `CK` decimal(8,4) DEFAULT NULL,
  `LDH` decimal(8,4) DEFAULT NULL,
  `CK_MB` decimal(8,4) DEFAULT NULL,
  `hsCRP` decimal(8,4) DEFAULT NULL,
  `BUN` decimal(8,4) DEFAULT NULL,
  `Cys_C` decimal(8,4) DEFAULT NULL,
  `BN_P` decimal(8,4) DEFAULT NULL,
  `HbA1C` decimal(8,4) DEFAULT NULL,
  `CIV` decimal(8,4) DEFAULT NULL,
  `LN` decimal(8,4) DEFAULT NULL,
  `pcⅢ` decimal(8,4) DEFAULT NULL,
  `HA` decimal(8,4) DEFAULT NULL,
  `HBDH` decimal(8,4) DEFAULT NULL,
  `IgA` decimal(8,4) DEFAULT NULL,
  `IgG` decimal(8,4) DEFAULT NULL,
  `IgM` decimal(8,4) DEFAULT NULL,
  `C4` decimal(8,4) DEFAULT NULL,
  `Cl` decimal(8,4) DEFAULT NULL,
  `Na` decimal(8,4) DEFAULT NULL,
  `K` decimal(8,4) DEFAULT NULL,
  `C3` decimal(8,4) DEFAULT NULL,
  `TBA` decimal(8,4) DEFAULT NULL,
  `Lp_a` decimal(8,4) DEFAULT NULL,
  `FER_Che` decimal(8,4) DEFAULT NULL,
  `Vtm_B12` decimal(8,4) DEFAULT NULL,
  `FOL` decimal(8,4) DEFAULT NULL,
  `P` decimal(8,4) DEFAULT NULL,
  `Ca` decimal(8,4) DEFAULT NULL,
  `Mg` decimal(8,4) DEFAULT NULL,
  `PRA` decimal(8,4) DEFAULT NULL,
  `AT_i` decimal(8,4) DEFAULT NULL,
  `AT_ii` decimal(8,4) DEFAULT NULL,
  `TRF` decimal(8,4) DEFAULT NULL,
  `INS_Ab` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ICA` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GAD_Ab` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INS0` decimal(8,4) DEFAULT NULL,
  `Tro_T` decimal(8,4) DEFAULT NULL,
  `MYO` decimal(8,4) DEFAULT NULL,
  `AMY` decimal(8,4) DEFAULT NULL,
  `C_P` decimal(8,4) DEFAULT NULL,
  `D_Dim` decimal(8,4) DEFAULT NULL,
  `TIBC` decimal(8,4) DEFAULT NULL,
  `Tfs` decimal(8,4) DEFAULT NULL,
  `AFP_Che` decimal(8,4) DEFAULT NULL,
  `CEA_Che` decimal(8,4) DEFAULT NULL,
  `IAA` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PLS` decimal(8,4) DEFAULT NULL,
  `WGT` decimal(8,4) DEFAULT NULL,
  `HGT` decimal(8,4) DEFAULT NULL,
  `SBP_R` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BMI` decimal(8,4) DEFAULT NULL,
  `DBP_R` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DBP` decimal(8,4) DEFAULT NULL,
  `SBP` decimal(8,4) DEFAULT NULL,
  `DBP_R2` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `SBP_R2` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `WST_M` decimal(8,4) DEFAULT NULL,
  `BUT` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `WdevB` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `BT` decimal(8,4) DEFAULT NULL,
  `BRT` decimal(8,4) DEFAULT NULL,
  `NTR` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `DEV` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `BF` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `BFR` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `BWR` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `MTB` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `Be_F` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `NTF` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `WST_F` decimal(8,4) DEFAULT NULL,
  `RHR` decimal(8,4) DEFAULT NULL,
  `QRS_WC` varchar(15) DEFAULT NULL,
  `P_RI` varchar(10) DEFAULT NULL,
  `Q_TI` varchar(10) DEFAULT NULL,
  `QTc` decimal(8,4) DEFAULT NULL,
  `CEA_Hrt` decimal(8,4) DEFAULT NULL,
  `ECG` varchar(15) DEFAULT NULL,
  `BBB` varchar(15) DEFAULT NULL,
  `SR` varchar(15) DEFAULT NULL,
  `AMI` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CEP` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `STT` varchar(15) DEFAULT NULL,
  `AJR` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CAR` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VEB` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SAB` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `AB` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `U_W` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WPW` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ETC` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `A_V` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `THY_Detail` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CEA` decimal(8,4) DEFAULT NULL,
  `AFP` decimal(8,4) DEFAULT NULL,
  `CA125` decimal(8,4) DEFAULT NULL,
  `F_PSA` decimal(8,4) DEFAULT NULL,
  `CA199` decimal(8,4) DEFAULT NULL,
  `T_PSA` decimal(8,4) DEFAULT NULL,
  `F_PSAdevT_PSA` decimal(8,4) DEFAULT NULL,
  `CA153` decimal(8,4) DEFAULT NULL,
  `CYF211` decimal(8,4) DEFAULT NULL,
  `SCC` decimal(8,4) DEFAULT NULL,
  `CA242` decimal(8,4) DEFAULT NULL,
  `CA724` decimal(8,4) DEFAULT NULL,
  `FER` decimal(8,4) DEFAULT NULL,
  `G17` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PGII` decimal(8,4) DEFAULT NULL,
  `PGI` decimal(8,4) DEFAULT NULL,
  `PGIdevPGII` decimal(8,4) DEFAULT NULL,
  `CA50` decimal(8,4) DEFAULT NULL,
  `NSE` decimal(8,4) DEFAULT NULL,
  `PSA` decimal(8,4) DEFAULT NULL,
  `TSGF` decimal(8,4) DEFAULT NULL,
  `TNF` decimal(8,4) DEFAULT NULL,
  `IFN` decimal(8,4) DEFAULT NULL,
  `ECS` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AFP_R` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CEA_R` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AFU` decimal(8,4) DEFAULT NULL,
  `ProGRP` decimal(8,4) DEFAULT NULL,
  `b_HCG` decimal(12,6) DEFAULT NULL,
  `CT` decimal(8,4) DEFAULT NULL,
  `FIO` decimal(8,4) DEFAULT NULL,
  `UIBC` decimal(8,4) DEFAULT NULL,
  `NMP22` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HE4` decimal(8,4) DEFAULT NULL,
  `EB_IgM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numAbnormal_chemical` decimal(2,0) DEFAULT NULL,
  `numAbnormal_blood` decimal(2,0) DEFAULT NULL,
  `numAbnormal_general` decimal(2,0) DEFAULT NULL,
  `numAbnormal_heart` decimal(2,0) DEFAULT NULL,
  `numAbnormal_thyroid` decimal(2,0) DEFAULT NULL,
  `numAbnormal_tumour` decimal(2,0) DEFAULT NULL,
  `numAbnormal_total` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
