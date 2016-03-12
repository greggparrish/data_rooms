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
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
    @proj_list = current_user.projects.order(:title)
  end

  def show
    @documents = @project.documents
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      @project.users << current_user
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
  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:avatar, :title, :description, :thumbnail)
  end
end
