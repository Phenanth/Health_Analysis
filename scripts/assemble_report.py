import json
import os

folders = ['blood', 'chemical', 'general', 'heart', 'thyroid', 'tumour']
# folders = ['failed']
limit = 120


for folder in folders:
	filepath = './data/reports/' + folder + '/'
	filehead = 'data_report_' + folder + '_'
	# filehead = 'data_failed_ids_'

	def readData(path):
		with open(path, "r", encoding="utf-8") as f:
			text = f.read()

		return text

	def saveData(data, path):
		with open(path, 'w', encoding="utf-8") as file:
			json.dump(data, file, ensure_ascii=False, indent=4)

	data = []
	count = 0

	for index in range(limit):
		filename = filepath + filehead + str(index) + '.json'

		try:
			d = json.loads(readData(filename))

		except FileNotFoundError:
			print(index, "not found.")
			continue

		for index2 in range(len(d)):
			count = count + 1
			data.append(d[index2])

	print("Count:", count)
	saveData(data, './data/reports/data_report_'+ folder +'_total.json')
