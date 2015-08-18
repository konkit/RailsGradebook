class Subject < ActiveRecord::Base
  has_and_belongs_to_many :divisions
  belongs_to :teacher
  has_many :grades

  validates_presence_of :teacher
  validates :name, presence: true, format: { with: /\A[A-Za-z]+\z/, message: "can have only letters"}
end
