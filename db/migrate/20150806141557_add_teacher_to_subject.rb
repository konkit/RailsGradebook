class AddTeacherToSubject < ActiveRecord::Migration
  def change
    add_reference :subjects, :teacher, index: true
    add_foreign_key :subjects, :teachers
  end
end
