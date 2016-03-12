class AddThumbnailToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :thumbnail, :string
  end
end
