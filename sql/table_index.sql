CREATE TABLE `list_index` (
  `scientificName`varchar(13) NOT NULL,
  `reportName` varchar(30) NOT NULL,
  `genre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

 select distinct scientificName, count(scientificName)
 from list_index
 where genre="chemical"
 group by scientificName
 order by count(scientificName);