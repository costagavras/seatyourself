class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params [:id])
  end

  def create
    
  end

  def update

  end

  def edit

  end

  def destroy

  end

end
