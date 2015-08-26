require 'rails_helper'

RSpec.describe Grade, type: :model do
  it 'has a valid factory' do
    grade = FactoryGirl.build(:grade)
    expect(grade).to be_valid
  end

  it { should validate_presence_of(:student) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:gradevalue) }

  it 'should validate numericality' do
    should validate_numericality_of(:gradevalue)
      .only_integer
      .is_less_than_or_equal_to(6)
      .is_greater_than_or_equal_to(1)
  end

  describe 'get_grades_for_report' do
    let!(:teacher) { FactoryGirl.create(:teacher) }
    let(:subject) { FactoryGirl.create(:subject, teacher: teacher) }
    let!(:student) { FactoryGirl.create(:student) }

    let(:grade1) do
      FactoryGirl.create(:grade, subject: subject, student: student)
    end
    let(:grade2) do
      FactoryGirl.create(:grade, subject: subject, student: student)
    end

    context 'called with Teacher as param' do
      let!(:otherTeacher) do
        FactoryGirl.create(:teacher, email: Faker::Internet.email)
      end
      let(:otherSubject) do
        FactoryGirl.create(:subject, teacher: otherTeacher)
      end
      let(:grade3) do
        FactoryGirl.create(:grade, subject: otherSubject, student: student)
      end

      it 'should return grades from subject lead by given teacher' do
        expect(Grade.get_grades_for_report(teacher)).to eq([grade1, grade2])
      end
    end

    context 'called with Student as param' do
      let!(:otherStudent) { FactoryGirl.create(:student) }
      let(:grade3) { FactoryGirl.create(:grade, student: otherStudent) }

      it 'should return grades from provided student only' do
        expect(Grade.get_grades_for_report(student)).to eq([grade1, grade2])
      end
    end

    context 'called with Principal as param' do
      it 'should return all grades' do
        principal = FactoryGirl.create(:principal)
        expect(Grade.get_grades_for_report(principal)).to eq([grade1, grade2])
      end
    end
  end
end
