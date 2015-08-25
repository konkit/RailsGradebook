class Student < User
  has_many :grades
  belongs_to :division

  validates_presence_of :division, :name

  def self.get_student_grades_map(division_id, subject_id)
    Student.includes(:grades).where(division_id: division_id).map do |student|
      {
        student: student,
        grades: student.grades.where(subject_id: subject_id)
      }
    end
  end

  def grades_by_subject
    Grade.includes(:subject)
      .where(student: self)
      .group_by { |grade| grade.subject.name }
  end
end
