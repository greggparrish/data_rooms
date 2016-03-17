# == Schema Information
#
# Table name: folders
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class FoldersController < InheritedResources::Base
  def new
    @folder = current_user.folder.new
    @project = Project.find(params[:project_id])
    redirect_to project_path(@project)
  end

  private
    def folder_params
      params.require(:folder).permit(:title, :slug, :project_id)
    end
end

