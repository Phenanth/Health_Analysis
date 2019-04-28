import json
import time
import pymysql

datapath = '../data/index/'
datahead = 'index_'

datapath_report = '../data/reports/'
datahead_report = 'data_report_'


items = ["blood", "chemical", "general", "heart", "thyroid", "tumour"]

sql_create_table_head = "create table `"
sql_create_table_tail = "` (reportId varchar(32)) ENGINE=InnoDB"
sql_alter_table_head = "ALTER TABLE `"
sql_add_primary_key_tail = "` ADD PRIMARY KEY (reportId)"

sql_add_column_mid = "` ADD COLUMN "

# DB连接
connection = pymysql.connect(host='localhost', user='root', password='charlotte2', db='health', charset='gbk', cursorclass=pymysql.cursors.DictCursor)

def contain_zh(word):
    '''
    判断传入字符串是否包含中文
    :param word: 待判断字符串
    :return: True:包含中文  False:不包含中文
    '''
    for c in word:
    	if '\u4e00' <= c <= '\u9fa5':
    		return True

    return False

def readData(path):
	with open(path, "r", encoding="utf-8") as f:
		text = f.read()

	return text

# 查询原数据文件，查看该数据列的数据内容类型是什么
# 本来应该把这部分的数据也存在index里，这样就不需要每个都查询了..不过反正也只是一次性的东西，就这样吧
def judgeDataType(item, index, mapping):
	dataname_report = datapath_report + datahead_report + item + "_total.json"
	data_report = json.loads(readData(dataname_report))

	value = ""
	dataType = ""
	for i in range(len(data_report)):
		# print(data_report[i].keys())
		# print(index)
		# time.sleep(1)
		for j in range(len(mapping)):
			found = 0
			index_official = ""
			if mapping[j]["reportName"] in data_report[i].keys():
				index_official = mapping[j]["scientificName"]
				key = mapping[j]["reportName"]
			if index == index_official:
				value = data_report[i][key][1]
				if value == "" or value == " ":
					value = data_report[i][key][0]
				found = 1
				break
		if found == 1:
			break

	length = len(value)
	if value == "" or value == " ":
		dataType = "string"
	# 这个在入库的时候也要处理一下数据，去掉最后一位
	elif value[length-1:length] == "s" or value[length-1:length] == "°":
		dataType = "decimal"
	elif contain_zh(value):
		dataType = "string"
	elif int(value[length-1:length]) >= 0 and int(value[length-1:length]) <= 9:
		dataType = "decimal"

	return dataType

for item in items:

	print("\n", item, ":")
	dataname = datapath + datahead + item + ".json"
	data = readData(dataname)
	indexs = json.loads(data)["indexs"]
	mapping = json.loads(data)["mapping"]

	# 新建表
	sql_create_table = sql_create_table_head + item + sql_create_table_tail
	sql_add_primary_key = sql_alter_table_head + item + sql_add_primary_key_tail

	print(sql_create_table, sql_add_primary_key)

	# sql execute
	try:
		with connection.cursor() as cursor:
			# cursor.execute(sql_create_table)
			# cursor.execute(sql_add_primary_key)

			# connection.commit()
			# 为新建的表添加列数据

			for index in indexs:

				sql_add_column = sql_alter_table_head + item + sql_add_column_mid + index

				for i in range(len(mapping)):
					if index == mapping[i]["reportName"]:
						index_official = mapping[i]["scientificName"]

				# 判断该列数据项内容是数值还是字符串形式
				flag = judgeDataType(item, index_official, mapping)
				if flag == "decimal":
					sql_add_column = sql_add_column + " decimal(8, 4)"
				elif flag == "string":
					if item != "thyroid":
						sql_add_column = sql_add_column + " varchar(10)"
					else:
						sql_add_column = sql_add_column + " varchar(150)"

				print(sql_add_column)
				# cursor.execute(sql_add_column)


			sql_add_column = sql_alter_table_head + item + sql_add_column_mid + "clientId varchar(32)"
			print(sql_add_column)
			# cursor.execute(sql_add_column)

		# connection.commit()
	finally:
		print(item, " ended.")