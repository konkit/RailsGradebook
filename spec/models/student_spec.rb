require 'rails_helper'

RSpec.describe Student, type: :model do
  it "has a valid factory" do
    student = FactoryGirl.build(:student)
    expect(student).to be_valid
  end

  it "is invalid without division" do
    student = FactoryGirl.build(:student, division: nil)
    expect(student).to be_invalid
  end

  it "is invalid without name" do
    student = FactoryGirl.build(:student, division: nil)
    expect(student).to be_invalid
  end
end
