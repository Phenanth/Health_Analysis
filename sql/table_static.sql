CREATE TABLE `list_static` (
  `scientificName` varchar(13) NOT NULL,
  `minValue` decimal(12, 6) NOT NULL,
  `maxValue` decimal(12, 6) NOT NULL,
  `property` varchar(10),
  `genre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

update list_static set maxValue = 23.99 where scientificName="BMI";


update report_thyroid set numAbnormal = 0;
