class AddGradevalueToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :gradevalue, :integer, :null => false, :default => 5
  end
end
