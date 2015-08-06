class AddSubjectToGrade < ActiveRecord::Migration
  def change
    add_reference :grades, :subject, index: true
    add_foreign_key :grades, :subjects
  end
end
