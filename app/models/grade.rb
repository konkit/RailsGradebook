class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject

  validates_presence_of :student, :subject, :gradevalue
  validates_numericality_of :gradevalue {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 6
  }
end
