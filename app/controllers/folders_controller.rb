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
    @project = Project.find(params[:project][:project_id])
    @folder = @project.folder.new
  end

  def create
    @document = @user.documents.build(document_params)
    @projects = @user.projects
    @document.user_id = @user.id
    respond_to do |f|
      if @document.save
        @document.doc_permissions.create(user_id: @user.id, abilities: 0, expires: Time.zone.parse('2099-01-01 21:00'))
        f.html { redirect_to params[:document][:pid] != 'false' ? project_path(params[:document][:pid]) : @document, notice: 'Document added.' }
        f.json { render action: 'show', status: :created, location: @document }
      else
        f.html { render action: 'new' }
        f.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def folder_params
      params.require(:folder).permit(:title, :slug, :project_id, :document_id)
    end
end

