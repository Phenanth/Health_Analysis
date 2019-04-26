import json

filepath = './data/list/'

start = 0
end = 121

def readData(path):
	with open(path, "r", encoding="utf-8") as f:
		text = f.read()

	return text

def saveData(data, path):
	with open(path, 'w', encoding="utf-8") as file:
		json.dump(data, file, ensure_ascii=False, indent=4)

data = []

for index in range(end):
	filename = filepath + 'data_list_' + str(index) + '.json'

	text = readData(filename)
	d = json.loads(text)

	for index2 in range(len(d)):
		data.append(d[index2])

	# print(data, len(data))


filename = filepath[0:7] + 'data_list_total.json'
saveData(data, filename)

print('Saved: ', len(data))