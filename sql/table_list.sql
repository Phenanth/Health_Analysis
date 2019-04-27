CREATE TABLE `list_member` (
  `reportId` varchar(35) NOT NULL,
  `reportNo` varchar(20) NOT NULL,
  `clientId` varchar(35) NOT NULL,
  `clientName` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `unit` varchar(40) NOT NULL,
  `age` numeric(3) NOT NULL,
  `reportDate` varchar(10) NOT NULL,
  `examinationOrgan` varchar(10),
  `company` varchar(40) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `total` numeric(2) NOT NULL,
  `abnornmltotal` numeric(2) NOT NULL,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

CREATE TABLE `details_abnormal` (
  `abnormal_code`varchar(6) NOT NULL,
  `match_name` varchar(60) NOT NULL,
  `Main_Name` varchar(2) NOT NULL,
  `id` varchar(2) NOT NULL,
  PRIMARY KEY (`abnormal_code`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

CREATE TABLE `details_template` (
  `template_id` varchar(32) NOT NULL,
  `itemName` varchar(32) NOT NULL,
  `sectionName` varchar(10) NOT NULL,
  `refRang` varchar(100) NOT NULL,
  `minValue` numeric(10, 4) NOT NULL,
  `maxValue` numeric(10, 4) NOT NULL,
  `unit` varchar(10) NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

CREATE TABLE `report_index` (
  `scientificName` varchar(30) NOT NULL,
  `reportName` varchar(30) NOT NULL,
  `genre` varchar(8) NOT NULL,
  PRIMARY KEY(`scientificName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

