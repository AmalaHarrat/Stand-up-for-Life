class MissionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:query].present?
      @missions = Mission.where(city: params[:query])
    else
      @missions = Mission.all
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
