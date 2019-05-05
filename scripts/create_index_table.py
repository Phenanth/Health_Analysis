import json
import time
import pymysql

datapath = '../data/index/'
datahead = 'index_'

items = ["blood", "chemical", "general", "heart", "thyroid", "tumour"]

sql = "insert into list_index (`scientificName`, `reportName`, `genre`) values (%s, %s, %s)"

connection = pymysql.connect(host='localhost', user='root', password='charlotte2', db='health', charset='gbk', cursorclass=pymysql.cursors.DictCursor)

def readData(path):
	with open(path, "r", encoding="utf-8") as f:
		text = f.read()

	return text

def insert_index(item):

	data = json.loads(readData(datapath + datahead + item + '.json'))["mapping"]

	try:
		with connection.cursor() as cursor:

			for i in range(len(data)):
				try:
					cursor.execute(sql, (data[i]["scientificName"], data[i]["reportName"], item))

				except pymysql.err.DataError:
					print('DataError, source data:', data[i])
				except pymysql.err.IntegrityError:
					print("IntefrityError:", data[i])
					continue

		connection.commit()
	finally:
		print(item, "ended.")


for item in items:
	insert_index(item)

connection.close()