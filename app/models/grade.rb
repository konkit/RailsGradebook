class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject

  validates_presence_of :student, :subject, :gradevalue
end
