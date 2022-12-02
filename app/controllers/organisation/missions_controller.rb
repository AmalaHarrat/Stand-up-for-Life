class Organisation::MissionsController < ApplicationController

  def index
    # Afficher toutes MES missions
    @missions = current_user.missions
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.create(mission_params)
    @mission.user = current_user
    if @mission.save
      redirect_to organisation_mission_path(@mission)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # A VOIR SI NECESSAIRE
  # end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :category, :address, :city, :date, :duration, :max_participant, photos: [])
  end
end
