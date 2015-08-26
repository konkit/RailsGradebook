require 'rails_helper'

RSpec.describe Principal, type: :model do
  it 'has a valid factory' do
    principal = FactoryGirl.build(:principal)
    expect(principal).to be_valid
  end

  it { should validate_presence_of(:name) }
end
