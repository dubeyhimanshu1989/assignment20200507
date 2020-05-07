import csv
import json

class flatten:

	def __init__(self):
		self.inputfile = 'data.csv'
		self.outputfile = 'data.json'

	def main(self):
		readfile = open(self.inputfile,'r+')
		reader = csv.reader(readfile, delimiter = ',')

		tmp_list = []
		cnt=1
		for items in reader:
			if cnt>1:
				tmp_dict = {}
				tmp_dict['person_id'] = items[0]
				tmp_dict['datetime'] = items[1]
				tmp_dict['floor_level'] = items[2]
				tmp_dict['floor_level'] = items[3]

				tmp_list.append(tmp_dict)
			cnt+=1

		readfile.close()

		with open(self.outputfile, 'w+') as outfile:
			#print(json.dumps(tmp_list))
			json.dump(tmp_list, outfile, indent=2	)

if __name__ == '__main__':
	obj = flatten()
	obj.main()
