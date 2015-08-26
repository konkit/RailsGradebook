require 'rails_helper'

RSpec.describe Division, type: :model do
  it 'has a valid factory' do
    division = FactoryGirl.build(:division)
    expect(division).to be_valid
  end

  it { should have_many(:students) }

  it { should have_and_belong_to_many(:subjects) }

  it { should validate_presence_of(:name) }
end
