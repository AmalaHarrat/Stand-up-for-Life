class DashboardsController < ApplicationController
  def show
    # Je veux acceder aux missions bookée par current user
  @mission = @booking.mission
  end
end

# Récupérer les missions à venir du current_user (créer des missions + booking)
# Récupérer les missions effectuées du current_user
# Récupérer le score du current_user
