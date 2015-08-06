# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

student1 = User.new
student1.email = 'one@student.com'
student1.password = '321321321'
student1.password_confirmation = '321321321'
student1.save!

student1.add_role :student

teacher1 = User.new
teacher1.email = 'one@teacher.com'
teacher1.password = '321321321'
teacher1.password_confirmation = '321321321'
teacher1.save!

teacher1.add_role :teacher

principal1 = User.new
principal1.email = 'one@principal.com'
principal1.password = '321321321'
principal1.password_confirmation = '321321321'
principal1.save!

principal1.add_role :teacher
