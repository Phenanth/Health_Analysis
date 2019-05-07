import json
import pymysql

connection = pymysql.connect(host='localhost', user='root', password='charlotte2', db='health', charset='gbk', cursorclass=pymysql.cursors.DictCursor)

item = 'general'

"""
统计计算report_[genre]表内数据的总异常项

"""


# 通用，根据SQL语句获取一个表中特定条件的数据
def getDataFromDb(item, sql, data = None):

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

# 取出每一列对应的标准值
def getStaticData(item, indexs):

	results = {}
	obj = {'minValue': 0, 'maxValue': 0, 'propt': None}

	for i in range(len(indexs)):

		scientificName = indexs[i]["scientificName"]
		sql_select_static = 'select * from list_static where scientificName=\"' + scientificName + '\" and genre=\"' + item + '\"'
		
		temp_static = getDataFromDb(item, sql_select_static)

		obj = {'minValue': temp_static[0]['minValue'], 'maxValue': temp_static[0]['maxValue'], 'property': temp_static[0]['property']}
		results[temp_static[0]['scientificName']] = obj

	return results

# 是否是数字
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

# 是否包含汉字
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

# 可能会使用到，源数据优化以便统计计算
def formatting(value):

	result = value
	errorString1 = ".."

	if not is_number(value):
		if errorString1 in value:
			pos = value.find(errorString1)
			head = value[0:pos]
			tail = value[pos+1:len(value)]
			result = head + tail

	return result



# 判断数值是否正常
def isNormal(value, minValue, maxValue, propt):

	noRange = 0
	isString = 0
	normal = 0
	success = 1
	needPrint = 0

	# 优化源数据以方便计算
	value = formatting(value)

	if int(minValue) == 0 and int(maxValue) == 0:
		noRange = 1
	
	if propt is not None:
		isString = 1
	elif not is_number(value) and contain_zh(value):
		isString = 1

	try:
		# 如果数据缺失，不算异常
		if value == 0 or value == "0" or value == '':
			 normal = 1
		# 本身无范围，也无字符串判断结果
		elif noRange and not isString:
			normal = 1
		# 是字符串而且值与默认相等
		elif isString and value == propt:
			normal = 1
		# 不是字符串且在范围内
		elif not isString and (int(float(value)) <= maxValue and int(float(value)) >= minValue):
			normal = 1
		
	except TypeError:
		success = 0
		# print(value, type(value), minValue, maxValue, propt, noRange, isString)
		try:
			if float(value) == 0:
				 # 如果数据缺失，不算异常
				normal = 1
		except ValueError:
			needPrint = 1
	finally:
		pass

	return normal, success, needPrint


sql_select_report = 'select * from report_' + item
sql_select_index = 'select scientificName from list_index where genre=\"' + item + '\"'


# 取出本表内所有列名
indexs = getDataFromDb(item, sql_select_index)

# 取出所有列标准范围
data_static = getStaticData(item, indexs)

# 取出数据表内所有行
data_report = getDataFromDb(item, sql_select_report)

count = 0

print('Processing:', item)


# 对于每条报告记录，
for report in data_report:

	# 处理条数加一
	count = count + 1

	nAbnormal = 0
	reportId = report['reportId']

	# 统计每列数值的异常总数
	for key, value in data_static.items():
		if key is not 'reportId' and key is not 'clientId':
			normal, success, needPrint = isNormal(report[key], value['minValue'], value['maxValue'], value['property'])

			if not success and needPrint:
				print('Not success:', key, reportId, report[key], len(report[key]))
				# pass

			if not normal and success:
				# print('Abnormal:', report[key], value['minValue'], value['maxValue'], value['property'])
				nAbnormal = nAbnormal + 1

	sql_update_abnormal = 'update report_' + item + ' set numAbnormal = \"' + str(nAbnormal) + '\" where reportId = \"' + reportId + '\"' 

	with connection.cursor() as cursor:
		try:
			pass
			cursor.execute(sql_update_abnormal)
		finally:
			pass

	if count % 500 == 0 and count != 0:
		connection.commit()
		print('Finished:', count, nAbnormal, reportId)

connection.close()
