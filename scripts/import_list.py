import json
import pymysql

datapath = '../data/'
dataname_list = 'data_list_total.json'
datahead_report = 'data_report_'

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

def importList():
	data_list = json.loads(readData(datapath + dataname_list))

	try:
		with connection.cursor() as cursor:

			for index in range(len(data_list)):
				sql = "insert into list_member (`reportId`, `reportNo`, `clientId`, `clientName`, `gender`, `unit`, `age`, `reportDate`, `examinationOrgan`, `company`, `grade`, `total`, `abnornmltotal`) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

				try:
					cursor.execute(sql, (data_list[index]["reportId"], data_list[index]["reportNo"], data_list[index]["clientId"], data_list[index]["clientName"], data_list[index]["gender"], data_list[index]["unit"], data_list[index]["age"], data_list[index]["reportDate"], data_list[index]["examinationOrgan"], data_list[index]["company"], data_list[index]["grade"], data_list[index]["total"], data_list[index]["abnornmltotal"]))

				except pymysql.err.DataError:
					print('DataError, source data:', data[index])

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


def importReport():

	for index in range(len(items)):

		filename = datapath + 'reports/' + datahead_report + item[index]["folder"] + '_total.json'

		try:
			data_report = json.loads(reportDate(filename))
		except:
			continue

		for index2 in range(len(data_report)):
			continue

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
			# break
		# break


# importList()
getKeys()