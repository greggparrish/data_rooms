class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :title
      t.string :slug

      t.timestamps null: false
    end
    add_index :folders, :slug, unique: true
  end
end
