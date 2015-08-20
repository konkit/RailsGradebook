require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:user) { FactoryGirl.create(:teacher) }

  it "has a valid factory" do
    report = FactoryGirl.build(:report, user: user)
    expect(report).to be_valid
  end

  it "is invalid without user" do
    report = FactoryGirl.build(:report, user: nil)
    expect(report).to be_invalid
  end

  it "is invalid without status" do
    report = FactoryGirl.build(:report, user: user, status: nil)
    expect(report).to be_invalid
  end
end
