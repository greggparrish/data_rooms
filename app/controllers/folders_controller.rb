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
  before_action :authenticate_user!


  def new
    @folder = @project.folder.new
  end

  def create
    @folder = Folders::CreateFolder.call(@user, folder_params)
    respond_to do |f|
      if @folder.save
        f.html { redirect_to params[:document][:pid] != 'false' ? project_path(params[:folder][:project_id]) : @folder, notice: 'Folder added.' }
        f.json { render action: 'show', status: :created, location: @folder }
      else
        f.html { render action: 'new' }
        f.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_user
    @user = current_user
  end

  def folder_params
    params.require(:folder).permit(:title, :slug, :project_id, :created_by, document_ids:[])
  end
end

