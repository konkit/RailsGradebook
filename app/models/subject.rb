class Subject < ActiveRecord::Base
  has_and_belongs_to_many :divisions
  has_many :users   # teachers
  has_many :grades
end
