class AddReferencesToGrades < ActiveRecord::Migration
  def change
    add_reference :grades, :user, index: true
    add_foreign_key :grades, :users

    add_reference :grades, :subject, index: true
    add_foreign_key :grades, :users
  end
end
