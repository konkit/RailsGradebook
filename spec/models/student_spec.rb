require 'rails_helper'

RSpec.describe Student, type: :model do
  it "has a valid factory" do
    student = FactoryGirl.build(:student)
    expect(student).to be_valid
  end

  it "is invalid without division" do
    student = FactoryGirl.build(:student, division: nil)
    expect(student).to be_invalid
  end

  it "is invalid without name" do
    student = FactoryGirl.build(:student, name: nil)
    expect(student).to be_invalid
  end

  describe "get_students_grades_map" do
    let!(:division) { FactoryGirl.create(:division) }
    let!(:students) { FactoryGirl.create_list(:student, 2, division: division) }
    let!(:subject)  { FactoryGirl.create(:subject) }
    let!(:grades)   { FactoryGirl.create_list(:grade, 2, subject: subject, student: students[0]) }
    let!(:grade_from_other_subject) { FactoryGirl.create(:grade, subject: FactoryGirl.create(:subject), student: students[0]) }

    it "should show grades from given division and subject" do
      result = Student.get_student_grades_map(division.id, subject.id)
      expected =  [
        { student: students[0], grades: [grades[0], grades[1]] },
        { student: students[1], grades: [] }
      ]
      expect(result).to match_array( expected )
    end
  end
end
