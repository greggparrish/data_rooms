# == Schema Information
#
# Table name: doctrees
#
#  id          :integer          not null, primary key
#  document_id :integer
#  folder_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DoctreesController < InheritedResources::Base

  private

    def doctree_params
      params.require(:doctree).permit(:document_id, :folder_id)
    end
end

