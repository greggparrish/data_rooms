# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  thumbnail   :string(255)
#  slug        :string(255)
#

class ProjectsController < ApplicationController  
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = @user.projects
    @proj_list = @user.projects.order(:title)
  end

  def show
    @document = @user.documents.new
    @documents = @project.documents
    @folder = Folder.new
    @folders = @project.folders
    @projects = @user.projects
  end

  def new
    @project = @user.projects.new
  end

  def create
    @project = @user.projects.create(project_params)
    if @project.save
      @project.stakeholders.create(user_id: @user.id, abilities: 0, expiration: Time.zone.parse('2099-01-01 21:00'))
      flash[:success] = "Project added."
      redirect_to projects_path
    else
      flash[:alert] = "Project couldn't be added. Check form for errors."
      render :new
    end
  end 

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to :back
  end

  private
  def set_user
    @user = @user
  end

  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:avatar, :title, :description, :thumbnail, :project_id, :user_id, :abilities, :expiration)
  end
end
