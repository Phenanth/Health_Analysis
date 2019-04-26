import requests
import json

"""
没有用到，用的是网页直接复制粘贴
http://115.236.55.91:4415/WebServer/DataDictionary/OrganAbnormal/GetAbnormalName.aspx?pageIndex=0&pageSize=3586

想麻烦了
"""


url2 = "http://115.236.55.91:4415/WebServer/DataDictionary/OrganAbnormal/GetAbnormalName.aspx"

formdata2 = {
	# "reportId": "9bd530a30f5d49f7bf5c87516bf57b80",
	# "clientId": "51d100b2922442ec8b8b70eed9477147",
	# "reportTemplateId": "6085f517b26946a7af924eecdf1f4023"
	"pageIndex": 0,
	"pageSize": 10
}

def getAbnormal(tree):

	xpaths = ["//*[@id=\"tbReportAbnormal\"]/tbody/tr[2]/td[1]/@abnormalname"]
	result = []

	for index in range(len(xpaths)):
		print(tree.xpath(xpaths[index]))
		content = tree.xpath(xpaths[index])[0]
		result.append(content)

	return result


html = requests.post(url2, formdata2).text
print(html)
# tree = etree.HTML(html)
# abnormal = getAbnormal(tree)
