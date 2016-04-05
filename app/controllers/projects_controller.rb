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
  after_action :verify_authorized, except: [:index, :create]
  after_filter :verify_policy_scoped, :only => :index

  def index
    @projects = policy_scope(Project)
  end

  def show
    authorize @project
    @projects = policy_scope(Project)
    @documents = policy_scope(Document).joins(:projects).where(projects: {id: @project})
    @document = @project.assets.new
    @folder = Folder.new
    @folders = @project.folders
  end

  def new
    @project = @user.projects.new
  end

  def create
    @project = @user.projects.build(project_params)
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
    authorize @project, :update?
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to :back
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action on this project."
    redirect_to(@project)
  end

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:avatar, :title, :description, :thumbnail, :project_id, :user_id)
  end
end
