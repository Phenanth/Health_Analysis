import json

genre = [1, "chemical"]

data_path = '../data/test/index_col.json'

data_result_path = '../data/index/index_' + genre[1] + '.json'

results = []
colnames = []

def readData(path):
	with open(path, "r", encoding="utf-8") as f:
		text = f.read()

	return text

def saveData(data, path):
	with open(path, 'w', encoding="utf-8") as file:
		json.dump(data, file, ensure_ascii=False, indent=4)


def addResults(reportName, scientificName):
	item = {"reportName": reportName, "scientificName": scientificName}
	results.append(item)

data = json.loads(readData(data_path))[genre[0]][genre[1]]

for index in range(len(data)):

	if data[index] == "reportId" or data[index] == "clientId":
		continue

	print("\n当前 colnames 集合内容与编号如下：\n（如果此行以下没有内容则为空）")

	for index2 in range(len(colnames)):
		print(index2,  colnames[index2])

	print(len(colnames), '代表新建该分类\n')

	result = input("\n当前数据为：\n" + str(data[index]) +  "\n你觉得它属于哪个分类？编号是什么？\n")
	result = int(result)

	if result == len(colnames):
		addResults(data[index], data[index])
		colnames.append(data[index])
	else:
		addResults(data[index], colnames[result])


obj = {
	"indexs": colnames,
	"mapping": results
}

saveData(obj, data_result_path)