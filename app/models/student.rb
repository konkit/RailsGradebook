class Student < User
  has_many :grades
  belongs_to :division

  validates_presence_of :division, :name
end
