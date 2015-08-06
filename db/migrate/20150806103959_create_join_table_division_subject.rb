class CreateJoinTableDivisionSubject < ActiveRecord::Migration
  def change
    create_join_table :divisions, :subjects do |t|
      # t.index [:division_id, :subject_id]
      # t.index [:subject_id, :division_id]
    end
  end
end
