class RemovePathFromReport < ActiveRecord::Migration
  def change
    remove_column :reports, :path, :string
  end
end
