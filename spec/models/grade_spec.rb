require 'rails_helper'

RSpec.describe Grade, type: :model do
  it "has a valid factory" do
    grade = FactoryGirl.build(:grade)
    expect(grade).to be_valid
  end

  it "is invalid without student" do
    grade = FactoryGirl.build(:grade, student: nil)
    expect(grade).to be_invalid
  end

  it "is invalid without subject" do
    grade = FactoryGirl.build(:grade, subject: nil)
    expect(grade).to be_invalid
  end

  it "is invalid without grade" do
    grade = FactoryGirl.build(:grade, gradevalue: nil)
    expect(grade).to be_invalid
  end

  it "is invalid if grade is not integer" do
    grade = FactoryGirl.build(:grade, gradevalue: 4.5)
    expect(grade).to be_invalid
  end

  it "is invalid if grade is higher than 6" do
    grade = FactoryGirl.build(:grade, gradevalue: 7)
    expect(grade).to be_invalid
  end

  it "is invalid if grade is lower than 1" do
    grade = FactoryGirl.build(:grade, gradevalue: 0)
    expect(grade).to be_invalid
  end
end
