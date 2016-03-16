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

