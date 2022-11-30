class Organisation::MissionsController < ApplicationController
  def index
    # Afficher toutes MES missions
    @missions = Mission.all
  end

  def show
  end

  def new
  end

  # def edit
  # A VOIR SI NECESSAIRE
  # end

  def update
  end
end
