import json
import time
import datetime
import requests

url_list = "http://115.236.55.91:4415/WebServer/HealthArchives/HealthReport/GetReportInfoList.aspx"

DIVISION = 100
RECORD = 50
SPAN = 5

program_id = 1

filepath = './data/list/'


def callRequests(url, formdata):
	try:
		r = requests.post(url, formdata)
	except:
		pass
	else:
		return json.loads(r.text)

data_template = {
	"pageIndex": 0,
	"pageSize": DIVISION
}

def saveData(data, path):
	with open(path, 'w', encoding="utf-8") as file:
		json.dump(data, file, ensure_ascii=False, indent=4)

data = []

num_total = int(callRequests(url_list, data)["total"])

# print(num_total, type(num_total))

num_pages = int(num_total / DIVISION)
isRemained = num_total % DIVISION

print(num_pages, isRemained)

if isRemained != 0:
	num_pages = num_pages + 1

# index = 0 + program_id * RECORD
# start = index
# num_pages = RECORD + program_id * RECORD
# count_section = 0 + program_id * RECORD / SPAN

index = 595
start = 595
num_pages = 601
count_section = 119


# print(num_pages, index, count_section)

# for index in range(num_pages):


while index < num_pages:

	if index % SPAN == 0 and index != start:

		saveData(data, filepath + 'data_list_' + str(count_section) + '.json')
		data = []
		count_section = count_section + 1

	data_tmp = data_template

	data_tmp["pageIndex"] = index

	str_t = str(datetime.datetime.now())
	print(data_tmp, ', ', str_t)

	d = callRequests(url_list, data_tmp)

	# print(d["data"])

	for index2 in range(len(d["data"])):
		data.append(d["data"][index2])

	print("Scrawl:", data_tmp["pageIndex"])

	index = index + 1
	# data.append(d)
	# time.sleep(0.5)

saveData(data, filepath + 'data_list_' + str(count_section) + '.json')
