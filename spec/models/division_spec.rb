require 'rails_helper'

RSpec.describe Division, type: :model do
  it "has a valid factory" do
    division = FactoryGirl.build(:division)
    expect(division).to be_valid
  end

  it "is invalid without name" do
    division = FactoryGirl.build(:division, name: nil)
    expect(division).to be_invalid
  end
end
