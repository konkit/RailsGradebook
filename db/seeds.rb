# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

division1 = Division.create(name: "I B")

student1 = Student.new
student1.name = 'John Student'
student1.email = 'one@student.com'
student1.password = '321321321'
student1.password_confirmation = '321321321'
student1.division = division1
student1.save!

teacher1 = Teacher.new
teacher1.name = 'John Teacher'
teacher1.email = 'one@teacher.com'
teacher1.password = '321321321'
teacher1.password_confirmation = '321321321'
teacher1.save!

principal1 = Principal.new
principal1.name = 'John Principal'
principal1.email = 'one@principal.com'
principal1.password = '321321321'
principal1.password_confirmation = '321321321'
principal1.save!

subject1 = Subject.new(name: 'Maths', teacher: teacher1)
subject1.save!
division1.subjects << subject1

subject2 = Subject.new(name: 'English', teacher: teacher1)
subject2.save!
division1.subjects << subject2

subject3 = Subject.new(name: 'Biology', teacher: teacher1)
subject3.save!
division1.subjects << subject3

grade1 = Grade.new
grade1.gradevalue = 5
grade1.subject = subject1
grade1.student = student1
grade1.save!

grade1 = Grade.new
grade1.gradevalue = 4
grade1.subject = subject2
grade1.student = student1
grade1.save!

grade1 = Grade.new
grade1.gradevalue = 3
grade1.subject = subject3
grade1.student = student1
grade1.save!
