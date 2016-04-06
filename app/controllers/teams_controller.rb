# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  thumbnail   :string(255)
#

class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :create]
  after_filter :verify_policy_scoped, :only => :index

  def index
    @teams = policy_scope(Team)
  end

  def show
    authorize @team
  end

  def new
    @team = @user.teams.new
  end

  def create
    @team = @user.teams.new(team_params)
    if @team.save
      @team.memberships.create(user_id: @user.id, abilities: 0, expiration: Time.zone.parse('2099-01-01 21:00'))
      flash[:success] = "Team added."
      redirect_to teams_path
    else
      flash[:alert] = "Team couldn't be added. Check form for errors."
      render :new
    end
  end


  def edit
    authorize @team, :update? 
  end

  def update
    authorize @team
    if @team.update(team_params)
      redirect_to teams_path
    else
      render :edit
    end
  end

  def destroy
    authorize @team
    @team.destroy
    redirect_to teams_path
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(@team)
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def team_params
    params.require(:team).permit(:title, :description, :thumbnail, :abilities, :expiration, user_ids: [])
  end

end
