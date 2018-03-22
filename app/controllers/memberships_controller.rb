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

class MembershipsController < InheritedResources::Base

  private

    def membership_params
      params.require(:membership).permit(:user_id, :team_id)
    end
end

