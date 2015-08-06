class Student < User
  has_many :grades
  belongs_to :division
end
