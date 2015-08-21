FactoryGirl.define do
  factory :grade do
    student { FactoryGirl.build(:student) }
    subject
    gradevalue 5
  end

end
