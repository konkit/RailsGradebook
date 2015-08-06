class AddStudentToGrade < ActiveRecord::Migration
  def change
    add_reference :grades, :student, index: true
    add_foreign_key :grades, :students
  end
end
