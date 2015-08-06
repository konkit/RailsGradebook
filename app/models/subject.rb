class Subject < ActiveRecord::Base
  has_and_belongs_to_many :divisions
  belongs_to :teacher
  has_many :grades
end
