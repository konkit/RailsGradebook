require 'rails_helper'

RSpec.describe Principal, type: :model do
  it "has a valid factory" do
    principal = FactoryGirl.build(:principal)
    expect(principal).to be_valid
  end

  it "is invalid without name" do
    principal = FactoryGirl.build(:principal, name: nil)
    expect(principal).to be_invalid
  end
end
