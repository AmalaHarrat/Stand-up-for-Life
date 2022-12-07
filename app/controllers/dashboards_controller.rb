class DashboardsController < ApplicationController
  def show
    # Je veux acceder aux missions bookée par current user
    @progression = current_user.total_score % 100
    @next_badge = 100 - @progression
  end
end

# Récupérer les missions à venir du current_user (créer des missions + booking)
# Récupérer les missions effectuées du current_user
# Récupérer le score du current_user
