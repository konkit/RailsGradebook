require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it "has a valid factory" do
    teacher = FactoryGirl.build(:teacher)
    expect(teacher).to be_valid
  end

  it "is invalid without name" do
    teacher = FactoryGirl.build(:teacher, name: nil)
    expect(teacher).to be_invalid
  end
end
