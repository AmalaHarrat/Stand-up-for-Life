class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @missions = Mission.all

    @missions = @missions.where("city ILIKE ?", "%#{params[:search][:city]}%") if params.dig(:search, :city).present?
    if params.dig(:search, :category).present?
      @missions = @missions.where("category ILIKE ?", "%#{params[:search][:category]}%")
    end
    @missions = @missions.where(date: params[:search][:date].to_date) if params.dig(:search, :date).present?
    @markers = @missions.geocoded.map do |mission|
      {
        lat: mission.latitude,
        lng: mission.longitude,
        info_window: render_to_string(partial: "info_window", locals: { mission: }),
        image_url: helpers.asset_url("marker.png")
      }
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
