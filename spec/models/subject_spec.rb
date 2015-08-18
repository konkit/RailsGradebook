require 'rails_helper'

RSpec.describe Subject, type: :model do
  it "has a valid factory" do
    subject = FactoryGirl.build(:subject)
    expect(subject).to be_valid
  end

  it "is invalid without teacher" do
    subject = FactoryGirl.build(:subject, teacher: nil)
    expect(subject).to be_invalid
  end

  it "is invalid without name" do
    subject = FactoryGirl.build(:subject, name: nil)
    expect(subject).to be_invalid
  end

  it "is invalid when name has numbers" do
    subject = FactoryGirl.build(:subject, name: "M4ths")
    expect(subject).to be_invalid
  end
end
