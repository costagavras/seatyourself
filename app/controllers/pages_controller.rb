class PagesController < ApplicationController
  def home
    if current_user
      @user = current_user
      @reservations = Reservation.where(user_id: @user.id)
    end

    @top_spots = Restaurant.all.first(4)
    @categories = Category.all.first(4)
    @neighbourhoods = Neighbourhood.all.first(4)
    
    render :home
  end
end
