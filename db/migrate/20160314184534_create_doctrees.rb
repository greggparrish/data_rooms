class CreateDoctrees < ActiveRecord::Migration
  def change
    create_table :doctrees do |t|
      t.integer :document_id
      t.integer :folder_id

      t.timestamps null: false
    end
  end
end
