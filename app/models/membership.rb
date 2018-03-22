# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  abilities  :integer
#  expiration :datetime
#

class Membership < ActiveRecord::Base
  include Approvable
  include Sortable
  belongs_to :user
  belongs_to :team
end
