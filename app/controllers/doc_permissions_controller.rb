# == Schema Information
#
# Table name: doc_permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  document_id :integer
#  expires     :datetime
#  abilities   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DocPermissionsController < InheritedResources::Base

  private
    def doc_permission_params
      params.require(:doc_permission).permit()
    end
end

