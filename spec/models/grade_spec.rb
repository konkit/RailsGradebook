require 'rails_helper'

RSpec.describe Grade, type: :model do
  it "has a valid factory" do
    grade = FactoryGirl.build(:grade)
    expect(grade).to be_valid
  end

  it "is invalid without student" do
    grade = FactoryGirl.build(:grade, student: nil)
    expect(grade).to be_invalid
  end

  it "is invalid without subject" do
    grade = FactoryGirl.build(:grade, subject: nil)
    expect(grade).to be_invalid
  end

  it "is invalid without grade" do
    grade = FactoryGirl.build(:grade, gradevalue: nil)
    expect(grade).to be_invalid
  end

  it "is invalid if grade is not integer" do
    grade = FactoryGirl.build(:grade, gradevalue: 4.5)
    expect(grade).to be_invalid
  end

  it "is invalid if grade is higher than 6" do
    grade = FactoryGirl.build(:grade, gradevalue: 7)
    expect(grade).to be_invalid
  end

  it "is invalid if grade is lower than 1" do
    grade = FactoryGirl.build(:grade, gradevalue: 0)
    expect(grade).to be_invalid
  end

  describe "get_grades_for_report" do
    let(:teacher) { FactoryGirl.create(:teacher, email: Faker::Internet.email ) }
    let(:subject) { FactoryGirl.create(:subject, teacher: teacher) }
    let(:student) { FactoryGirl.create(:student, email: Faker::Internet.email) }
    let(:grade1)  { FactoryGirl.create(:grade, subject: subject, student: student ) }
    let(:grade2)  { FactoryGirl.create(:grade, subject: subject, student: student ) }

    context "called with Teacher as param" do
      it "should return grades from subject lead by given teacher" do
        otherTeacher = FactoryGirl.create(:teacher, email: Faker::Internet.email )
        otherSubject = FactoryGirl.create(:subject, teacher: otherTeacher)
        grade3 = FactoryGirl.create(:grade, subject: otherSubject, student: student );

        expect(Grade.get_grades_for_report(teacher)).to eq([grade1, grade2])
      end
    end

    context "called with Student as param" do
      it "should return grades from provided student only" do
        otherStudent = FactoryGirl.create(:student)
        grade3 = FactoryGirl.create(:grade, student: otherStudent)

        expect(Grade.get_grades_for_report(student)).to eq([grade1, grade2])
      end
    end

    context "called with Principal as param" do
      it "should return all grades" do
        principal = FactoryGirl.create(:principal)
        expect(Grade.get_grades_for_report(principal)).to eq([grade1, grade2])
      end
    end
  end
end
