class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @missions = Mission.all
<<<<<<< HEAD
    @markers = @missions.geocoded.map do |mission|
      {
        lat: mission.latitude,
        lng: mission.longitude
      }
=======
    if params.dig(:search, :city).present?
      @missions = @missions.where("city ILIKE ?", "%#{params[:search][:city]}%")
    end
    if params.dig(:search, :category).present?
      @missions = @missions.where("category ILIKE ?", "%#{params[:search][:category]}%")
    end
    if params.dig(:search, :date).present?
      @missions = @missions.where(date: params[:search][:date].to_date)
>>>>>>> master
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
