class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]

  def new
    @mission = Mission.find(params[:mission_id])
    @booking = Booking.new
  end

  def show
    @mission = @booking.mission
  end

  def create
    # @mission = Mission.find(params[:mission_id])
    @booking = Booking.new(booking_params)
    # @booking.mission = @mission
    @booking.user = current_user
    if @booking.save
      # redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:mission_id)
  end
end
