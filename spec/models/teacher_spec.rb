require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it 'has a valid factory' do
    teacher = FactoryGirl.build(:teacher)
    expect(teacher).to be_valid
  end

  it { should have_many(:subjects) }

  it { should validate_presence_of(:name) }
end
