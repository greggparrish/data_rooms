# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  document_id :integer
#  expires     :datetime
#  abilities   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PermissionsController < InheritedResources::Base

  private

    def permission_params
      params.require(:permission).permit(:user_id, :document_id)
    end
end

