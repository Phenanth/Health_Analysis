CREATE TABLE `list_static` (
  `scientificName` varchar(13) NOT NULL,
  `minValue` decimal(12, 6) NOT NULL,
  `maxValue` decimal(12, 6) NOT NULL,
  `property` varchar(10),
  `genre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

