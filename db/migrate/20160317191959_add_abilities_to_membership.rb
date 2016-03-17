class AddAbilitiesToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :abilities, :integer
  end
end
