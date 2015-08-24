FactoryGirl.define do
  factory :report do
    status :ready
    user { FactoryGirl.create(:teacher, email: Faker::Internet.email) }
  end

end
