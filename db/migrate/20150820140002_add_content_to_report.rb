class AddContentToReport < ActiveRecord::Migration
  def change
    add_column :reports, :content, :text
  end
end
