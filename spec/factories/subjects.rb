FactoryGirl.define do
  factory :subject do
    teacher { FactoryGirl.build(:teacher) }
    name 'Maths'
  end

end
