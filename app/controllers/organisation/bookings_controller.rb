class Organisation::BookingsController < ApplicationController
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    # Pas de redirect car on veut rester sur la meme page
    # redirect_to organisation_mission_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:firstname, :scoring)
  end
end
