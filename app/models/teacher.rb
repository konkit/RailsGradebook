class Teacher < User
  has_many :subjects

  validates_presence_of :name
end
