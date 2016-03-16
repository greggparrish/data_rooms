class AddProjectAssociationToFolder < ActiveRecord::Migration
  def self.up
    add_column :folders, :project_id, :integer
    add_index 'folders', ['project_id'], :name => 'index_project_id' 
  end

  def self.down
    remove_column :folders, :project_id
  end
end
