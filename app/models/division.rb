class Division < ActiveRecord::Base
  has_and_belongs_to_many :subjects
  has_many :students

  validates_presence_of :name
end
