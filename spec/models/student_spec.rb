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
    student = FactoryGirl.build(:student, division: nil)
    expect(student).to be_invalid
  end

  describe "get_students_grades_map" do
    it "should show grades from given division and subject" do
      division = FactoryGirl.create(:division)

      student1 = FactoryGirl.create(:student, email: Faker::Internet.email, division_id: division.id)
      student2 = FactoryGirl.create(:student, email: Faker::Internet.email, division_id: division.id)

      subject1 = FactoryGirl.create(:subject)

      grade1_1 = FactoryGirl.create(:grade, subject: subject1, student: student1)
      grade1_2 = FactoryGirl.create(:grade, subject: subject1, student: student1)
      grade_from_other_subject = FactoryGirl.create(:grade, subject: FactoryGirl.create(:subject), student: student1)

      result = Student.get_student_grades_map(division.id, subject1.id)
      expected =  [
        { student: student1, grades: [grade1_1, grade1_2] },
        { student: student2, grades: [] }
      ]
      expect(result).to match_array( expected )
    end
  end
end
