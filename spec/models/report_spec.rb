require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:user) { FactoryGirl.create(:teacher) }

  it 'has a valid factory' do
    report = FactoryGirl.build(:report, user: user)
    expect(report).to be_valid
  end

  it { should belong_to(:user) }

  it { should validate_presence_of(:status) }

  it { should validate_presence_of(:user) }

  it { should define_enum_for(:status).with([:in_progress, :ready]) }
end
