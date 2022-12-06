class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @missions = Mission.all

    if params.dig(:search, :city).present?
      @missions = @missions.where("city ILIKE ?", "%#{params[:search][:city]}%")
    end
    if params.dig(:search, :category).present?
      @missions = @missions.where("category ILIKE ?", "%#{params[:search][:category]}%")
    end
    if params.dig(:search, :date).present?
      @missions = @missions.where(date: params[:search][:date].to_date)
    end
    @markers = @missions.geocoded.map do |mission|
      {
        lat: mission.latitude,
        lng: mission.longitude,
        info_window: render_to_string(partial: "info_window", locals: {mission: mission})
      }
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
