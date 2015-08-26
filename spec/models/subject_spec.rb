require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'has a valid factory' do
    subject = FactoryGirl.build(:subject)
    expect(subject).to be_valid
  end

  it { should have_and_belong_to_many(:divisions) }

  it { should belong_to(:teacher) }

  it { should have_many(:grades) }

  it { should validate_presence_of(:teacher) }

  it { should validate_presence_of(:name) }

  it 'should fail if name has other characters than letters' do
    expect(FactoryGirl.build(:subject, name: 'Maths')).to be_valid
    expect(FactoryGirl.build(:subject, name: 'M4ths')).to_not be_valid
    expect(FactoryGirl.build(:subject, name: 'Math||s')).to_not be_valid
  end
end
