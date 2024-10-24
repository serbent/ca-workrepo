import yaml

with open('student.yaml', 'r') as file:
	student_data = yaml.safe_load(file)

student_data['grade'] = '10/10'
student_data['LastMeal'] = 'pizza'

if 'subjects' in student_data:
	del student_data['subjects']

with open('student.yaml', 'w') as file:
	yaml.dump(student_data, file, sort_keys=False)

print('Data manipulated')
