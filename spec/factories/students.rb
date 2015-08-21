FactoryGirl.define do
  factory :student do
    name Faker::Name.name
    email { Faker::Internet.email }
    role 'Student'
    password '123456789'
    password_confirmation '123456789'
    division
  end
end
