import json
import pymysql

datapath = '../data/'
dataname_list = 'data_list_total.json'
datahead_report = 'data_report_'

dataname_abnormal = 'data_abnormal.json'
dataname_template = 'data_template.json'

limit = 120

items = [
	{"folder": 'blood', "sql": "insert into record_blood"}, 
	{"folder": 'chemical', "sql": "insert into record_chemical"}, 
	{"folder": 'general', "sql": "insert into record_general"},
	{"folder": 'heart', "sql": "insert into record_heart"},
	{"folder": 'thyroid', "sql": "insert into record_heart"}, 
	{"folder": 'tumour', "sql": "into into record_tumour"}
]

connection = pymysql.connect(host='localhost', user='root', password='charlotte2', db='health', charset='gbk', cursorclass=pymysql.cursors.DictCursor)

# ````````````````````````````````````````````````````````````````

def readData(path):
	with open(path, "r", encoding="utf-8") as f:
		text = f.read()

	return text

def getDbData():
	with connection.cursor() as cursor:
		sql = "select * from list_member"
		cursor.execute(sql)
		result = cursor.fetchall()

	return result

# ````````````````````````````````````````````````````````````````
# 建表途中统计分析用，已完成
# 查看各种分类下一共有多少种不同的数据名称
def getKeys():
	for index in range(len(items)):
		keys = []
		filename = datapath + 'reports/' + datahead_report + items[index]["folder"] + '_total.json'
		data = json.loads(readData(filename))
		for index2 in range(len(data)):
			for key in data[index2]:
				# print(key)
				flag = 0
				for index3 in range(len(keys)):
					if key == keys[index3]:
						flag = 1
						break
				if flag != 1:
					keys.append(key)

		print(keys)

# ````````````````````````````````````````````````````````````````

# 导入用户信息，已完成
def importList():
	data_list = json.loads(readData(datapath + dataname_list))

	try:
		with connection.cursor() as cursor:

			for index in range(len(data_list)):
				sql = "insert into list_member (`reportId`, `reportNo`, `clientId`, `clientName`, `gender`, `unit`, `age`, `reportDate`, `examinationOrgan`, `company`, `grade`, `total`, `abnornmltotal`) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

				try:
					cursor.execute(sql, (data_list[index]["reportId"], data_list[index]["reportNo"], data_list[index]["clientId"], data_list[index]["clientName"], data_list[index]["gender"], data_list[index]["unit"], data_list[index]["age"], data_list[index]["reportDate"], data_list[index]["examinationOrgan"], data_list[index]["company"], data_list[index]["grade"], data_list[index]["total"], data_list[index]["abnornmltotal"]))

				except pymysql.err.DataError:
					print('DataError, source data:', data_list[index])

				except pymysql.err.IntegrityError:
					continue

				if (index + 1) % 300 == 0:
					print('Index:', index)

		connection.commit()

	# except:
	# 	print("Error.")

	finally:
		print('Finished importing list, count:', len(data_list))
		connection.close()

# 导入异常标准信息，已完成
def importAbnormal():
	filename = datapath + dataname_abnormal
	data_abnormal = json.loads(readData(filename))["data"]

	try:
		with connection.cursor() as cursor:

			for index in range(len(data_abnormal)):
				sql = "insert into details_abnormal (`abnormal_code`, `match_name`, `Main_Name`, `id`) VALUES (%s, %s, %s, %s)"

				try:
					cursor.execute(sql, (data_abnormal[index]["abnormal_code"], data_abnormal[index]["match_name"], data_abnormal[index]["Main_Name"], data_abnormal[index]["id"]))
				except pymysql.err.DataError:
					print('DataError, source data:', data_abnormal[index])
				except pymysql.err.IntegrityError:
					continue

				if (index + 1) % 300 == 0:
					print('Index:', index)

		connection.commit()

	finally:
		print('Finished importing abnormal details, count:', len(data_abnormal))
		connection.close()

# 导入Template数据，已完成
def importTemplate():
	filename = datapath + dataname_template
	data_template = json.loads(readData(filename))["data"]

	try:
		with connection.cursor() as cursor:

			for index in range(len(data_template)):
				sql = "insert into details_template (`template_id`, `itemName`, `sectionName`, `refRang`, `minValue`, `maxValue`, `unit`) VALUES (%s, %s, %s, %s, %s, %s, %s)"

				try:
					if data_template[index]["maxValue"] == "":
						maxV = 0
					else:
						maxV = data_template[index]["maxValue"]
					if data_template[index]["minValue"] == "":
						minV = 0
					else:
						minV = data_template[index]["minValue"]

					cursor.execute(sql, (data_template[index]["Id"], data_template[index]["itemName"], data_template[index]["sectionName"], data_template[index]["refRang"], minV, maxV, data_template[index]["unit"]))
				except pymysql.err.DataError:
					print('DataError, source data:', data_template[index])
				except pymysql.err.IntegrityError:
					continue

				if (index + 1) % 50 == 0:
					print('Index:', index)

		connection.commit()

	finally:
		print('Finished importing template details, count:', len(data_template))
		connection.close()


# ````````````````````````````````````````````````````````````````

# 导入Report各个分类的数据，未完成
# 首先要完成建表的统计工作
def importReport():

	for index in range(len(items)):

		filename = datapath + 'reports/' + datahead_report + item[index]["folder"] + '_total.json'

		try:
			data_report = json.loads(reportDate(filename))
		except:
			continue

		for index2 in range(len(data_report)):
			continue


# ````````````````````````````````````````````````````````````````

# 函数在此得到执行
# getKeys()
# importList()
# importAbnormal()
# importTemplate()
