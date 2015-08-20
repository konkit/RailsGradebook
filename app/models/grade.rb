class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject

  validates_presence_of :student, :subject, :gradevalue
  validates :gradevalue, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 6
  }

  def self.get_grades_for_report(user)
    if user.role == "Teacher"
      return Grade.includes(:subject).where(:subjects => { :teacher_id => user.id } )
    elsif user.role == "Student"
      return Grade.where(student: user)
    elsif user.role == "Principal"
      return Grade.all
    end
  end
end
