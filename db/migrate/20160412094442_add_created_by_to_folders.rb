class AddCreatedByToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :created_by, :integer
  end
end
