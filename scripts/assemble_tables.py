import json
import pymysql

connection = pymysql.connect(host='localhost', user='root', password='charlotte2', db='health', charset='gbk', cursorclass=pymysql.cursors.DictCursor)

# 取一个数据量最大的表的作为标准
item_first = 'thyroid'
items = [
			'blood',
			'chemical',
			'general',
			'heart',
			'thyroid',
			'tumour'
		]

NUM_INDEX = 183


sql_select_index = 'select scientificName from list_index'

"""
整合report_[genre]表内所有数据

"""

# 通用，根据SQL语句获取一个表中特定条件的数据
def getDataFromDb(sql, data = None):

	try:
		with connection.cursor() as cursor:
			try:
				if data:
					cursor.execute(sql, data)
				else:
					cursor.execute(sql)
				temp = cursor.fetchall()

			finally:
				pass

	finally:
		return temp

# 生成向总表插入数据的SQL文
# 后续插入数据时要按照此顺序插入数据
def generateInsertSQL(data_indexs):

	sql_insert = 'insert into report_total (`reportId`, `clientId`, `'

	for i in range(NUM_INDEX - 1):
		sql_insert = sql_insert + data_indexs[i]['scientificName'] + '`, `'

	sql_insert = sql_insert + data_indexs[NUM_INDEX]['scientificName'] + '`, `numAbnormal_chemical`, `numAbnormal_blood`, `numAbnormal_general`, `numAbnormal_heart`, `numAbnormal_thyroid`, `numAbnormal_tumour`, `numAbnormal_total`) values ('

	for i in range(NUM_INDEX + 8):
		sql_insert = sql_insert + '%s, '
	sql_insert = sql_insert + '%s)'

	return sql_insert


# 取一个表数据
def getSingleTable(item, reportId = None):

	if not reportId:
		sql_tmp = 'select * from report_' + item
	else:
		sql_tmp = 'select * from report_' + item + ' where reportId=\"' + reportId + '\"'

	data_tmp = getDataFromDb(sql_tmp)

	return data_tmp


data_indexs = getDataFromDb(sql_select_index)
sql_insert = generateInsertSQL(data_indexs)

# 作为标准
data_metrics = getSingleTable(item_first)

# 对每个report进行的数据整合操作
for data_metric in data_metrics:

	count = 0
	reportId = data_metric['reportId']
	clientId = data_metric['clientId']
	numAbnormals = [] # 用保存各表的异常值

	data = (reportId, clientId)

	# 根据reportId获得该Id其他表的数据
	for item in items:

		data_table = getSingleTable(item, reportId)[0]
		length_data = len(data_table) - 3 # 统计该表有几个数据列，去掉没用的几列数据
		count_tmp = count + length_data

		print(data_table)
		# 从index表中找匹配数据
		while count < count_tmp:
			if data_indexs[count]['scientificName']
			data = data + (data_table[data_indexs[count]['scientificName']],)
			count = count + 1

		# 添加异常项，等待所有表项数据添加完毕后再进行添加
		numAbnormals.append(data_table['numAbnormal'])

		count = count_tmp

		# 目前有问题
		print(data, numAbnormals)

	if reportId == '00000db4e5284f52a7742ae000553ec5':
		break

