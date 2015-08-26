require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'has a valid factory' do
    student = FactoryGirl.build(:student)
    expect(student).to be_valid
  end

  it { should have_many(:grades) }

  it { should belong_to(:division) }

  it { should validate_presence_of(:division) }

  it { should validate_presence_of(:name) }

  describe 'get_students_grades_map' do
    let!(:division) { FactoryGirl.create(:division) }
    let!(:students) { FactoryGirl.create_list(:student, 2, division: division) }
    let!(:subject)  { FactoryGirl.create(:subject) }
    let!(:grades) do
      FactoryGirl.create_list(:grade, 2, subject: subject, student: students[0])
    end
    let!(:grade_from_other_subject) do
      tmp_subject = FactoryGirl.create(:subject)
      FactoryGirl.create(:grade, subject: tmp_subject, student: students[0])
    end

    it 'should show grades from given division and subject' do
      result = Student.get_student_grades_map(division.id, subject.id)
      expected = [
        { student: students[0], grades: [grades[0], grades[1]] },
        { student: students[1], grades: [] }
      ]
      expect(result).to match_array(expected)
    end
  end

  describe 'grades_by_subject' do

  end
end
