class Organisation::BookingsController < ApplicationController

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to @booking.mission
  end

  private

  def booking_params
    params.require(:booking).permit(:firstname, :scoring)
  end
end
