FactoryGirl.define do
  factory :teacher do
    name Faker::Name.name
    email Faker::Internet.email
    role 'Teacher'
    password '123456789'
    password_confirmation '123456789'
  end
end
