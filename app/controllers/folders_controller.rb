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
  before_action :set_user
  before_action :set_folder, only: [:show, :edit, :update, :destroy, :file_documents]
  before_action :authenticate_user!

  def new
    @folder = @folder.new
  end

  def create
    @project = Project.find(params[:folder][:project_id])
    if FolderPolicy.new(@user, @project).update? 
      @folder = Folders::CreateFolder.call(@user, @project, folder_params)
      if @folder.persisted?
        redirect_to @project, notice: "Folder successfully created."
      else
        render action: "new"
      end
    else
      redirect_to @project, alert: "Insufficient permissions"
    end
  end

  def file_documents
    authorize @folder
  end

  def update
    authorize @folder
    if @folder.update(folder_params)
      redirect_to folder_path(@folder)
    else
      render :edit
    end
  end

  private
  def set_user
    @user = current_user
  end

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:title, :slug, :project_id, :created_by, document_ids:[])
  end
end

