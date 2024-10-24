import json

with open('student.json', 'r') as file:
	student_data = json.load(file)

student_data['grade'] = 'B-'
student_data['BankCardCode'] = 'LT456879789456'

if 'subjects' in student_data:
	del student_data['subjects']

with open('student.json', 'w') as file:
	json.dump(student_data, file, indent=4)

print("Data manipulated")
