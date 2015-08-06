# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

student1 = Student.new
student1.email = 'one@student.com'
student1.password = '321321321'
student1.password_confirmation = '321321321'
student1.save!

teacher1 = Teacher.new
teacher1.email = 'one@teacher.com'
teacher1.password = '321321321'
teacher1.password_confirmation = '321321321'
teacher1.save!

principal1 = Principal.new
principal1.email = 'one@principal.com'
principal1.password = '321321321'
principal1.password_confirmation = '321321321'
principal1.save!

subject1 = Subject.new
subject1.save!

subject2 = Subject.new
subject2.save!

subject3 = Subject.new
subject3.save!
