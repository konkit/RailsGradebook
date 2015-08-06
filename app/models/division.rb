class Division < ActiveRecord::Base
  has_and_belongs_to_many :subjects
  has_many :grades
  has_many :students
end
