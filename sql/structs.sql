-- MySQL dump 10.13  Distrib 5.6.43, for Win64 (x86_64)
--
-- Host: localhost    Database: health
-- ------------------------------------------------------
-- Server version	5.6.43-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `details_abnormal`
--

DROP TABLE IF EXISTS `details_abnormal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details_abnormal` (
  `abnormal_code` varchar(6) NOT NULL,
  `match_name` varchar(60) NOT NULL,
  `Main_Name` varchar(2) NOT NULL,
  `id` varchar(2) NOT NULL,
  PRIMARY KEY (`abnormal_code`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `details_template`
--

DROP TABLE IF EXISTS `details_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details_template` (
  `template_id` varchar(32) NOT NULL,
  `itemName` varchar(32) NOT NULL,
  `sectionName` varchar(10) NOT NULL,
  `refRang` varchar(100) NOT NULL,
  `minValue` decimal(10,4) NOT NULL,
  `maxValue` decimal(10,4) NOT NULL,
  `unit` varchar(10) NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `list_index`
--

DROP TABLE IF EXISTS `list_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_index` (
  `scientificName` varchar(13) NOT NULL,
  `reportName` varchar(30) NOT NULL,
  `genre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `list_member`
--

DROP TABLE IF EXISTS `list_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_member` (
  `reportId` varchar(35) NOT NULL,
  `reportNo` varchar(20) NOT NULL,
  `clientId` varchar(35) NOT NULL,
  `clientName` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `unit` varchar(40) NOT NULL,
  `age` decimal(3,0) NOT NULL,
  `reportDate` varchar(10) NOT NULL,
  `examinationOrgan` varchar(10) DEFAULT NULL,
  `company` varchar(40) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `total` decimal(2,0) NOT NULL,
  `abnornmltotal` decimal(2,0) NOT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `list_static`
--

DROP TABLE IF EXISTS `list_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_static` (
  `scientificName` varchar(13) NOT NULL,
  `minValue` decimal(12,6) NOT NULL,
  `maxValue` decimal(12,6) NOT NULL,
  `genre` varchar(10) NOT NULL,
  `property` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_blood`
--

DROP TABLE IF EXISTS `report_blood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_blood` (
  `reportId` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
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
  `clientId` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `numAbnormal` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_chemical`
--

DROP TABLE IF EXISTS `report_chemical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_chemical` (
  `reportId` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
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
  `clientId` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `numAbnormal` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_general`
--

DROP TABLE IF EXISTS `report_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_general` (
  `reportId` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
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
  `clientId` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `numAbnormal` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_heart`
--

DROP TABLE IF EXISTS `report_heart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_heart` (
  `reportId` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
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
  `clientId` varchar(32) CHARACTER SET latin1 DEFAULT NULL,
  `numAbnormal` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_thyroid`
--

DROP TABLE IF EXISTS `report_thyroid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_thyroid` (
  `reportId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `THY_Detail` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numAbnormal` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_total`
--

DROP TABLE IF EXISTS `report_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `THY_Detail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `G17` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PGII` decimal(8,4) DEFAULT NULL,
  `PGI` decimal(8,4) DEFAULT NULL,
  `PGIdevPGII` decimal(8,4) DEFAULT NULL,
  `CA50` decimal(8,4) DEFAULT NULL,
  `NSE` decimal(8,4) DEFAULT NULL,
  `PSA` decimal(8,4) DEFAULT NULL,
  `TSGF` decimal(8,4) DEFAULT NULL,
  `TNF` decimal(8,4) DEFAULT NULL,
  `IFN` decimal(8,4) DEFAULT NULL,
  `ECS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AFP_R` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CEA_R` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AFU` decimal(8,4) DEFAULT NULL,
  `ProGRP` decimal(8,4) DEFAULT NULL,
  `b_HCG` decimal(12,6) DEFAULT NULL,
  `CT` decimal(8,4) DEFAULT NULL,
  `FIO` decimal(8,4) DEFAULT NULL,
  `UIBC` decimal(8,4) DEFAULT NULL,
  `NMP22` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HE4` decimal(8,4) DEFAULT NULL,
  `EB_IgM` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numAbnormal_chemical` decimal(2,0) DEFAULT NULL,
  `numAbnormal_blood` decimal(2,0) DEFAULT NULL,
  `numAbnormal_general` decimal(2,0) DEFAULT NULL,
  `numAbnormal_heart` decimal(2,0) DEFAULT NULL,
  `numAbnormal_thyroid` decimal(2,0) DEFAULT NULL,
  `numAbnormal_tumour` decimal(2,0) DEFAULT NULL,
  `numAbnormal_total` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_tumour`
--

DROP TABLE IF EXISTS `report_tumour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_tumour` (
  `reportId` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `clientId` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numAbnormal` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 16:52:44
