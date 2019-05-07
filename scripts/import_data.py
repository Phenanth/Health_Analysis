import json
import pymysql

"""
将各个json文件的数据导入数据库的工具合集

导入的算法还有优化的余地，但是在发现正确导入记录的优化判断条件之前，这个工具的使用应该已经告一段落了。
"""

datapath = '../data/'
dataname_list = 'data_list_total.json'
datahead_report = 'data_report_'
datamid_report = 'reports/'

dataname_abnormal = 'data_abnormal.json'
dataname_template = 'data_template.json'

limit = 120
# 中断点。由于导入效率很低设置这个方便从中途调试完的部分接着继续开始
BREAKPOINT = -1
DIVISION = 50

items = [
			# {"folder": 'blood', "sql1": "insert into report_blood"}
			{"folder": 'chemical', "sql1": "insert into report_chemical"},
			{"folder": 'general', "sql1": "insert into report_general"},
			{"folder": 'heart', "sql1": "insert into report_heart"},
			{"folder": 'thyroid', "sql1": "insert into report_thyroid"}
			# {"folder": 'tumour', "sql1": "insert into report_tumour"},
]

connection = pymysql.connect(
								host='localhost', 
								user='root',
								password='charlotte2', 
								db='health', 
								charset='gbk', 
								cursorclass=pymysql.cursors.DictCursor
							)

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
# 导入用户数据，已完成

def ifIndexIn(data, index, item):
	results = []
	sql_select = "select distinct reportName from list_index where scientificName=\"" + index + "\"" + "and genre=\"" + item + "\""
	# print(sql_select)
	try:
		with connection.cursor() as cursor:
			# print(index)
			cursor.execute(sql_select)
			results = cursor.fetchall()
	finally:
		find = 0
		name = ""
		cursor.close()
		for i in range(len(results)):
			# print(results[i])
			if results[i]["reportName"] in data.keys():
				find = 1
				name = results[i]["reportName"]
				break

	return find, name

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

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        pass
 
    try:
        import unicodedata
        unicodedata.numeric(s)
        return True
    except (TypeError, ValueError):
        pass
 
    return False

def resolveData(value):
	data = ""
	length = len(value)
	try:
		if value == "" or value == " ":
			data = "0"
		elif value[length-1:length] == "s" or value[length-1:length] == "S" or value[length-1:length] == "°":
			data = value[0:length-1]
		elif contain_zh(value):
			data = value
		elif float(value[length-1:length]) >= 0 and float(value[length-1:length]) <= 9:
			data = value
	except ValueError:
		# print(value)
		data = value[0:length-1]
	
	if value[0:1] == '<' or value[0:1] == '>' or value[0:1] == '`': # 有待优化，为了调整首项包含非数字字符的数据
		data = value[1:length]

	return data

# 导入Report各个分类的数据，未完成
def importReport(item, sql_insert_head):

	sql_select = "select distinct scientificName from list_index where genre=\""
	sql_insert = sql_insert_head + " (`reportId`, `clientId`, "
	indexs = ['reportId', 'clientId']
	orders = {}

	try:
		with connection.cursor() as cursor:
			try:
				cursor.execute(sql_select + item + "\"")
				result = cursor.fetchall()
				# 添加所有名称
				for i in range(len(result)-1):
					indexs.append(result[i]["scientificName"])
					sql_insert = sql_insert + "`" + str(result[i]["scientificName"]) + "`, "
				indexs.append(result[len(result)-1]["scientificName"])
				# 添加所有格式化
				sql_insert = sql_insert + "`" + result[len(result)-1]["scientificName"] + "`) VALUES ("
				for i in range(len(result) + 1):
					sql_insert = sql_insert + "%s, "
				sql_insert = sql_insert + "%s)"

			finally:
				cursor.close()
				print(sql_insert)

	finally:
		pass
		# print(indexs)

	data_import = json.loads(readData(datapath + datamid_report + datahead_report + item + '_total.json'))

	# 根据每个数据项生成标准数据结构
	# 并加入表中
	data_items = []
	for i in range(len(data_import)):
		if i > BREAKPOINT:
			data_item = (data_import[i]["reportId"], data_import[i]["clientId"])

			# 添加数据项
			for j in range(len(indexs)):
				if indexs[j] is not "reportId" and indexs[j] is not "clientId":
					flag, name = ifIndexIn(data_import[i], indexs[j], item)
					if flag:
						data_item  = data_item + (resolveData(data_import[i][name][0]),)
					else:
						data_item = data_item + ("0",)
			data_items.append(data_item)
			# 50条保存一次
			if (i + 1) % DIVISION == 0:
				print(i+1, "Finished")
				try:
					with connection.cursor() as cursor:
						for k in range(len(data_items)):
							# print(data_items[k])
							try:
								cursor.execute(sql_insert, data_items[k])
							except pymysql.err.InternalError:
								# print('Data error:', data_item[k])
								pass
							except IndexError:
								# print('IndexError:', data_item[k])
								pass
					connection.commit()
				except pymysql.err.IntegrityError:
					pass
				except pymysql.err.DataError:
					print('Data too long:', data_items[k])
				except pymysql.err.InternalError:
					print('Data error:', data_item[k])
				finally:
					data_items = []
					pass



# ````````````````````````````````````````````````````````````````
# 导入范围数据至list_static，完成

# 将一个数据项里的所有reportName转换为scientificName并返回
def getIndexedKeys(data_item, item):
	results = {}
	try:
		with connection.cursor() as cursor:
			for key in data_item:
				if key != "reportId" and key != "clientId":

					try:
						count = cursor.execute("select scientificName from list_index where reportName=\"" + key + "\" and genre=\"" + item + "\"") # 限制genre很重要，不然reportName会重名
						try:
							result = cursor.fetchall()
							results[result[0]["scientificName"]] = key
						except IndexError:
							# pass
							print('IndexError:', key)
						finally:
							pass
					finally:
						pass
	finally:
		# print(results)
		pass

	return results

# 获取该分类下所有的index类别
def getAllIndex(sql_select, item):
	indexs = []
	try:
		with connection.cursor() as cursor:
			try:
				cursor.execute(sql_select + item + "\"")
				result = cursor.fetchall()
				# 添加所有名称
				for i in range(len(result)):
					indexs.append(result[i]["scientificName"])

			finally:
				cursor.close()

	finally:
		# print(indexs)
		pass

	return indexs

# 在全部数据项中寻找每个index第一次出现的数据位置并保存
def getStaticPos(indexs, data_import, item):
	pos = 0
	data_static = {}
	for i in range(len(indexs)):
		j = pos
		find = 0
		while j < len(data_import):
			# if (j + 1) % 1000 == 0:
			# 	print(indexs[i], j+1 , "nd.")
			keys = getIndexedKeys(data_import[j], item)

			# 如果和需要寻找的Index匹配
			if indexs[i] in keys:
				pos = j # 简单的剪枝，在这里找到的话就不再查找前面出现过的数据
				find = 1
				# print(indexs[i], keys[indexs[i]])
				data_static[indexs[i]] = [j, keys[indexs[i]]]
				break
			j = j + 1
		# 普通应该不会出现没找到的情况
		if find == 0:
			data_static[indexs[i]] = [-1, "Not Found"]

	return data_static


# 导入Static表的入口
def importStatic(item):

	sql_select = "select distinct scientificName from list_index where genre=\""
	sql_insert = "insert into list_static (`scientificName`, `minValue`, `maxValue`, `genre`, `property`) values (%s, %s, %s, %s, %s)"

	indexs = getAllIndex(sql_select, item)
	data_import = json.loads(readData(datapath + datamid_report + datahead_report + item + '_total.json'))
	
	data_statics = getStaticPos(indexs, data_import, item)

	# 处理value并导入数据
	for k, v in data_statics.items():
		pos = v[0]
		name = v[1]
		value = data_import[pos][name][1] # 需要处理的范围值
		# print(pos, name, value)

		propt = None
		if value == "" or value == " ":
			success = 1
			minValue = 0
			maxValue = 0
		elif value[0:1] == '≤' or value[0:1] == '<':
			success = 1
			minValue = 0
			maxValue = value[1:len(value)]
		else:
			success = 0
			try:
				ch1 = '-'
				ch2 = '~'
				p = value.index(ch1)
			except ValueError:
				try:
					p = value.index(ch2)
				except ValueError:
					# 中文
					success = 1
					minValue = 0
					maxValue = 0
					propt = value
				finally:
					if not success:
						success = 1
						minValue = value[0:p]
						maxValue = value[p+1:len(value)]
			finally:
				if not success:
					success = 1
					minValue = value[0:p]
					maxValue = value[p+1:len(value)]

		if success:
			print(k, value)
			data_static = (k, minValue, maxValue, item, propt)

			try:
				with connection.cursor() as cursor:
					try:
						cursor.execute(sql_insert, data_static)
					except pymysql.err.IntegrityError:
						continue
					except pymysql.err.InternalError:
						print('Value Error:', value, data_static)
					finally:
						pass
			finally:
				print("Insert:", k, data_static)
				pass

	connection.commit()

# ````````````````````````````````````````````````````````````````

# 函数在此得到执行
# getKeys()
# importList()
# importAbnormal()
# importTemplate()


for i in range(len(items)):
	# 导入report_[genre]表
	importReport(items[i]["folder"], items[i]["sql1"])
	# 导入list_static表
	# importStatic(items[i]["folder"])

connection.close()