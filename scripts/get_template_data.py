import json
import requests

filepath = './data/'

url3 = "http://115.236.55.91:4415/WebServer/DataDictionary/OrganItem/GetOrganItemToReportOperate.aspx"


formdata3 = {
	"templateId": "a2ad837128534979a8b44679398acb37",
	"pageIndex": 0,
	"pageSize": 591
}

def saveData(data, path):
	with open(path, 'w', encoding="utf-8") as file:
		json.dump(data, file, ensure_ascii=False, indent=4)

text = requests.post(url3, formdata3).text
templateData = json.loads(text)

print(templateData["data"][0])

saveData(templateData, filepath + 'data_template.json')

