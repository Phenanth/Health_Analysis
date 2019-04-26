import requests
import json
from datetime import datetime
from lxml import etree


"""


http://115.236.55.91:4415/WebServer/HealthArchives/HealthReport/ReportTempItem.aspx?reportId=a094d8fb53404174a3cd73a46f14a7f4&clientId=fcd09d9141c9431db1b03af8c01c6a9b&reportTemplateId=6085f517b26946a7af924eecdf1f4023

体重指数参考范围:(正常:18.5-23.99；超重:≥24；偏胖:24-27.9；肥胖:≥28)

有大范围的reportId是没办法获取的，无论将模板设置成什么都不可以获取，在考虑怎么去原页面里面定位出问题的是哪一类
去体检报告里看了一下，好像还没有相关的体检报告出来，所以就是没有的。

由于并不是所有的reportId都会有对应的报告，所以最后保存的文件数也会略小于全部都有报告的情况
"""

url = "http://115.236.55.91:4415/WebServer/HealthArchives/HealthReport/ReportTempItem.aspx"

data_path = "./data/data_list_total.json"

data_general_path = "./data/reports/general/data_report_general_"
data_tumour_path = "./data/reports/tumour/data_report_tumour_"
data_chemical_path = "./data/reports/chemical/data_report_chemical_"
data_blood_path = "./data/reports/blood/data_report_blood_"
data_thyroid_path = "./data/reports/thyroid/data_report_thyroid_"
data_heart_path = "./data/reports/heart/data_report_heart_"

data_failed_path = "./data/reports/data_failed_ids.json"

def readData(path):
	with open(path, "r", encoding="utf-8") as f:
		text = f.read()

	return text

def saveData(data, path):
	with open(path, 'w', encoding="utf-8") as file:
		json.dump(data, file, ensure_ascii=False, indent=4)


def getTree(url, reportId, clientId):

	formdata = {
		"reportId": reportId,
		"clientId": clientId,
		"reportTemplateId": "a2ad837128534979a8b44679398acb37"
	}

	html = requests.post(url, formdata).text
	tree = etree.HTML(html)

	return tree

def findIndex(tree):

	headerIndex = {
		"一般检查": 0,
		"肿瘤检测": 0,
		"生化检验": 0,
		"血常规": 0,
		"甲状腺彩超": 0,
		"心电图": 0
	}

	# 按照属性值匹配所有结点
	nodes = tree.xpath("//div[@class='exam-header']")

	length = len(nodes)

	xpath_head = "/html/body/div["
	xpath_tail = "]/h3/text()"

	for i in range(length):
		i = i + 1

		header = tree.xpath(xpath_head + str(i) + xpath_tail)[0]
		if header in headerIndex:
			headerIndex[header] = i

	# print(headerIndex)

	return headerIndex

def getGeneral(tree, p):


	result = {}
	xpath_head = "/html/body/table[" + str(p) + "]/tbody/tr["
	xpath_mid = "]/td["
	xpath_tail = "]/text()"
	xpath_tail2 = "]/input/@value"

	trs = tree.xpath("/html/body/table[" + str(p) + "]/tbody")[0]

	for i in range(len(trs) - 1):

		i = i + 1
		data = []

		tag = tree.xpath(xpath_head + str(i) + xpath_mid + "1" + xpath_tail)[0]
		data.append(tree.xpath(xpath_head + str(i) + xpath_mid + "2" + xpath_tail2)[0])
		data.append(tree.xpath(xpath_head + str(i) + xpath_mid + "3" + xpath_tail2)[0])

		result[tag] = data

	return result

def getData(indexs, reportId, clientId):

	result = {}

	# 防止当前报告没有对应项目测试的情况
	try:
		if indexs["一般检查"] != 0:
			result["一般检查"] = getGeneral(tree, indexs["一般检查"])
		else:
			result["一般检查"] = {}
		if indexs["肿瘤检测"] != 0:
			result["肿瘤检测"] = getGeneral(tree, indexs["肿瘤检测"])
		else:
			result["肿瘤检测"] = {}
		if indexs["生化检验"] != 0:
			result["生化检验"] = getGeneral(tree, indexs["生化检验"])
		else:
			result["生化检验"] = {}
		if indexs["血常规"] != 0:
			result["血常规"] = getGeneral(tree, indexs["血常规"])
		else:
			result["血常规"] = {}
		if indexs["甲状腺彩超"] != 0:
			result["甲状腺彩超"] = getGeneral(tree, indexs["甲状腺彩超"])
		else:
			result["甲状腺彩超"] = {}
		if indexs["心电图"] != 0:
			result["心电图"] = getGeneral(tree, indexs["心电图"])
		else:
			result["心电图"] = {}

	except:
		print(reportId, clientId)
		print(indexs)

	for key, value in result.items():
		value["reportId"] = reportId
		value["clientId"] = clientId

	# print(result)

	return result

def saveAll(data_general, data_tumour, data_chemical, data_blood, data_thyroid, data_heart, section):
	saveData(data_general, data_general_path + str(section) + '.json')
	saveData(data_tumour, data_tumour_path + str(section) + '.json')
	saveData(data_chemical, data_chemical_path + str(section) + '.json')
	saveData(data_blood, data_blood_path + str(section) + '.json')
	saveData(data_thyroid, data_thyroid_path + str(section) + '.json')
	saveData(data_heart, data_heart_path + str(section) + '.json')



data = json.loads(readData(data_path))
length = len(data)

index = 50000
end = 60080
section = 100

count = 0


data_general = []
data_tumour = []
data_chemical = []
data_blood = []
data_thyroid = []
data_heart = []

Failed = []

while index < end:

	reportId = data[index]["reportId"]
	clientId = data[index]["clientId"]
	reportTemplateId = ""

	tree = getTree(url, reportId, clientId)

	# 防止当前reportId并无对应报告的情况
	try:
		indexs = findIndex(tree)
		count = count + 1
	except:
		failed_item = {"reportId": reportId, "clientId": clientId}
		Failed.append(failed_item)
		print("Failed index:", index, reportId, clientId)
		index = index + 1
		continue

	report_data = getData(indexs, reportId, clientId)

	data_general.append(report_data["一般检查"])
	data_tumour.append(report_data["肿瘤检测"])
	data_chemical.append(report_data["生化检验"])
	data_blood.append(report_data["血常规"])
	data_thyroid.append(report_data["甲状腺彩超"])
	data_heart.append(report_data["心电图"])

	if ((count + 1) % 10 == 0):
		print("Scrawled:", count + 1, ", Time:", str(datetime.now()))

	if ((count + 1) % 500 == 0):
		saveAll(data_general, data_tumour, data_chemical, data_blood, data_thyroid, data_heart, section)
		section = section + 1

		data_general = []
		data_tumour = []
		data_chemical = []
		data_blood = []
		data_thyroid = []
		data_heart = []

	index = index + 1

# print("Scrawled:", length)
# saveAll(data_general, data_tumour, data_chemical, data_blood, data_thyroid, data_heart, section)

print("Failed Items count:", len(Failed))
saveData(Failed, data_failed_path)
