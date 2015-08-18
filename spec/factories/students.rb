FactoryGirl.define do
  factory :student do
    name Faker::Name.name
    email Faker::Internet.email
    role 'student'
    division
    password '123456789'
    password_confirmation '123456789'
  end

end
