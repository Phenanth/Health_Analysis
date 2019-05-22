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
num_mapping = {'10': 'a', '11': 'b', '12': 'c', '13': 'd', '14': 'e', '15': 'f', '16': 'g'}


NUM_INDEX = 183

sql_select_index = 'select distinct scientificName from list_index'

"""
整合report_[genre]表内所有数据

"""

# 通用，根据SQL语句获取一个表中特定条件的数据
def querySQL(sql, data = None):

	temp = None
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
		
	sql_insert = sql_insert + data_indexs[NUM_INDEX - 1]['scientificName'] + '`, `numAbnormal_chemical`, `numAbnormal_blood`, `numAbnormal_general`, `numAbnormal_heart`, `numAbnormal_thyroid`, `numAbnormal_tumour`, `numAbnormal_total`) values ('

	for i in range(NUM_INDEX + 8):
		sql_insert = sql_insert + '%s, '
	sql_insert = sql_insert + '%s)'

	return sql_insert


# 取表数据
def getSingleTable(item, reportId = None):

	if not reportId:
		sql_tmp = 'select * from report_' + item
	else:
		sql_tmp = 'select * from report_' + item + ' where reportId=\"' + reportId + '\"'

	data_tmp = querySQL(sql_tmp)

	return data_tmp


data_indexs = querySQL(sql_select_index)
sql_insert = generateInsertSQL(data_indexs)

# 作为标准
data_metrics = getSingleTable(item_first)


count = 0
# 对每个report进行的数据整合操作
for data_metric in data_metrics:

	fail = 0
	reportId = data_metric['reportId']
	clientId = data_metric['clientId']
	numAbnormals = [] # 用保存各表的异常值

	data = (reportId, clientId)
	data_temp = {}

	# 根据reportId获得该Id其他表的数据
	for item in items:

		try:
			data_table = getSingleTable(item, reportId)[0]
		except:
			fail = 1
			break
		data_temp = {**data_temp, **data_table}
		numAbnormals.append(data_table['numAbnormal'])

	if fail:
		continue

	# 合并单表数据
	for i in range(len(data_indexs)):
		data = data + (data_temp[data_indexs[i]['scientificName']],)

	# 合并abnormal数据并形成六位的标记
	abnormal_total = ''
	for i in range(len(items)):
		data = data + (numAbnormals[i],)
		try:
			if numAbnormals[i] < 10:
				abnormal_total = abnormal_total + str(numAbnormals[i])
			else:
				mapped_abnormal = num_mapping[str(numAbnormals[i])]
				abnormal_total = abnormal_total + mapped_abnormal
		except TypeError:
			break
			fail = 1
	if fail:
		continue
	data = data + (abnormal_total,)

	# print(sql_insert, data)

	querySQL(sql_insert, data)
	# connection.commit()

	if (count + 1) % 300 == 0:
		connection.commit()
		print('Inserted:', count + 1)

	count = count + 1

connection.close()
