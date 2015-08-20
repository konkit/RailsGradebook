class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :path
      t.string :filename
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
