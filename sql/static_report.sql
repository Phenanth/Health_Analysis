select max(numAbnormal) from report_blood;

mysql> select max(numAbnormal) from report_blood;
+------------------+
| max(numAbnormal) |
+------------------+
|               13 | -> 15
+------------------+
1 row in set (0.72 sec)

mysql> select max(numAbnormal) from report_chemical;
+------------------+
| max(numAbnormal) |
+------------------+
|               14 | -> 15
+------------------+
1 row in set (0.91 sec)

mysql> select max(numAbnormal) from report_general;
+------------------+
| max(numAbnormal) |
+------------------+
|                7 |
+------------------+
1 row in set (0.02 sec)

mysql> select max(numAbnormal) from report_heart;
+------------------+
| max(numAbnormal) |
+------------------+
|                9 | -> 7
+------------------+
1 row in set (0.34 sec)

mysql> select max(numAbnormal) from report_thyroid;
+------------------+
| max(numAbnormal) |
+------------------+
|                0 |
+------------------+
1 row in set (0.55 sec)

mysql> select max(numAbnormal) from report_tumour;
+------------------+
| max(numAbnormal) |
+------------------+
|                7 |
+------------------+
1 row in set (0.52 sec)

select reportId from report_chemical where numAbnormal=15 limit 1;

delete from list_static where scientificName='ASTdevALT';
insert into list_static (`scientificName`, `minValue`, `maxValue`, `genre`, `property`) values ('ASTdevALT', 0.8, 1.5, 'chemical', NULL);

# 查询最小值为0且无字符串属性的检查项目的范围
select * from list_static where genre="tumour" and minValue=0 and property is NULL;

# 按条件连接查询最小值为0且无字符串属性的检查项目的科学名词与报告名称
select distinct list_static.scientificName, list_index.reportName 
from list_static, list_index
where list_static.genre="tumour" 
and minValue=0 and property is NULL 
and list_static.scientificName=list_index.scientificName
group by list_static.scientificName;


# 异常阈值设置参考
mysql> select numAbnormal, count(numAbnormal) from report_blood group by numAbnormal;
+-------------+--------------------+
| numAbnormal | count(numAbnormal) |
+-------------+--------------------+
|           0 |               1999 |
|           1 |              14822 |
|           2 |              14198 |
|           3 |              11114 |
|           4 |               6669 |
|           5 |               3734 |
|           6 |               2030 |
|           7 |               1076 |
|           8 |                619 |
|           9 |                328 |
|          10 |                148 |
|          11 |                 82 |
|          12 |                 31 |
|          13 |                 13 |
|          14 |                  3 |
|          15 |                  1 |
+-------------+--------------------+
16 rows in set (0.04 sec)

mysql> select numAbnormal, count(numAbnormal) from report_chemical group by numAbnormal;
+-------------+--------------------+
| numAbnormal | count(numAbnormal) |
+-------------+--------------------+
|           0 |               6466 |
|           1 |              11565 |
|           2 |              12494 |
|           3 |               9885 |
|           4 |               7115 |
|           5 |               4576 |
|           6 |               2607 |
|           7 |               1310 |
|           8 |                567 |
|           9 |                225 |
|          10 |                 68 |
|          11 |                 31 |
|          12 |                 16 |
|          13 |                  2 |
|          14 |                  1 |
|          16 |                  1 | <- 这一条的测试数据应该是不准确的，汇总的时候会算入异常情况，直接丢掉
+-------------+--------------------+
16 rows in set (0.05 sec)

mysql> select numAbnormal, count(numAbnormal) from report_general group by numAbnormal;
+-------------+--------------------+
| numAbnormal | count(numAbnormal) |
+-------------+--------------------+
|           0 |              22571 |
|           1 |              22330 |
|           2 |               7667 |
|           3 |               2939 |
|           4 |                763 |
|           5 |                499 |
|           6 |                 43 |
|           7 |                 26 |
+-------------+--------------------+
8 rows in set (0.04 sec)

mysql> select numAbnormal, count(numAbnormal) from report_heart group by numAbnormal;
+-------------+--------------------+
| numAbnormal | count(numAbnormal) |
+-------------+--------------------+
|           0 |              43313 |
|           1 |               8981 |
|           2 |                 22 |
|           4 |                118 |
|           5 |                483 |
|           6 |                 29 |
|           7 |                  3 |
+-------------+--------------------+
7 rows in set (0.04 sec)

mysql> select numAbnormal, count(numAbnormal) from report_tumour group by numAbnormal;
+-------------+--------------------+
| numAbnormal | count(numAbnormal) |
+-------------+--------------------+
|        NULL |                  0 |
|           0 |              39655 |
|           1 |              12656 |
|           2 |               3016 |
|           3 |                922 |
|           4 |                209 |
|           5 |                 39 |
|           6 |                  2 |
|           7 |                  1 |
+-------------+--------------------+
9 rows in set (0.04 sec)
