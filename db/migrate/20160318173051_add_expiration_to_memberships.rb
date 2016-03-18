class AddExpirationToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :expiration, :datetime
  end
end
