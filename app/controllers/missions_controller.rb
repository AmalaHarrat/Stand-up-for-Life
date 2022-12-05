class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @missions = Mission.all
    @markers = @missions.geocoded.map do |mission|
      {
        lat: mission.latitude,
        lng: mission.longitude
      }
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
