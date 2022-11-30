class Organisation::MissionsController < ApplicationController
  def index
    # Afficher toutes MES missions
    @missions = current_user.missions
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
  end

  # def edit
  # A VOIR SI NECESSAIRE
  # end

  def update
  end
end
