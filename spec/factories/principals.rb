FactoryGirl.define do
  factory :principal do
    name Faker::Name.name
    email Faker::Internet.email
    role 'Principal'
    password '123456789'
    password_confirmation '123456789'
  end
end
