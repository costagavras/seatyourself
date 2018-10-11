class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @my_restaurants = Restaurant.where(:price_range => params[:price_range], :neighbourhood_id => params[:neighbourhood],:category_id => params[:category])
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new

    @restaurant.name = params[:restaurant][:name]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.picture_url = params[:restaurant][:picture_url]
    @restaurant.opening_hours = params[:restaurant][:opening_hours]
    @restaurant.closing_hours = params[:restaurant][:closing_hours]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.menu = params[:restaurant][:menu]

    @restaurant.neighbourhood_id = @neighbourhood.id
    @restaurant.category_id = @category.id
    if @restaurant.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/restaurants"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def update

  end

  def edit

  end

  def destroy

  end

end
