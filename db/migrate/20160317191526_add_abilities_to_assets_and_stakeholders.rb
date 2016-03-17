class AddAbilitiesToAssetsAndStakeholders < ActiveRecord::Migration
  def change
    add_column :assets, :abilities, :integer
    add_column :assets, :expiration, :datetime
    add_column :stakeholders, :abilities, :integer
    add_column :stakeholders, :expiration, :datetime
  end
end
