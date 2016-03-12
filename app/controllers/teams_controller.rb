class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = @user.teams
  end

  def new
    @team = @user.teams.new
  end

  def create
    @team = @user.teams.build(team_params)
    if @team.save
      @team.users << @user
      flash[:success] = "Team added."
      redirect_to teams_path
    else
      flash[:alert] = "Team couldn't be added. Check form for errors."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to teams_path
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  private
  def set_team
    @team = Team.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def team_params
    params.require(:team).permit(:title, :description, :thumbnail, user_ids: [])
  end

end
