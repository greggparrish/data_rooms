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
  before_action :authenticate_user!
  before_action :set_document, only: [:show, :edit, :update, :destroy, :permissions]
  before_action :set_user

  def show
    @document = Document.find(params[:id])
  end

  private
  def set_user
    @user = current_user
  end

  def set_document
    @document = Document.find(params[:id])
  end

  def doc_permission_params
    params.require(:document).permit(:doc_file, :title, :description, :user_id, :document_id, :abilities, :expiration, project_ids: [])
  end
end

