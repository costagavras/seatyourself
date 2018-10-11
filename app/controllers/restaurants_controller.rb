class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    if params[:price_range] == "nada" && params[:neighbourhood] == "nada" && params[:category] == "nada"
      @my_restaurants = Restaurant.all
    else
      @my_restaurants = Restaurant.where(:price_range => params[:price_range], :neighbourhood_id => params[:neighbourhood],:category_id => params[:category])
    end
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
    @restaurant.price_range = params[:price_range]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.menu = params[:restaurant][:menu]
    @restaurant.neighbourhood_id = params[:neighbourhood_id]
    @restaurant.category_id = params[:category_id]
    if @restaurant.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      flash[:notice] = "Restaurant added!"
      redirect_to "/restaurants"
    else
      # otherwise render new.html.erb
      flash[:alert] = "Restaurant not added!"
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:restaurant][:name]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.picture_url = params[:restaurant][:picture_url]
    @restaurant.opening_hours = params[:restaurant][:opening_hours]
    @restaurant.closing_hours = params[:restaurant][:closing_hours]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.price_range = params[:price_range]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.menu = params[:restaurant][:menu]
    @restaurant.neighbourhood_id = params[:neighbourhood_id]
    @restaurant.category_id = params[:category_id]


    if @restaurant.save
      flash[:notice] = "Restaurant updated !"
      redirect_to restaurants_path
     else
      render :edit
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    @restaurant = Product.find(params[:id])
    @restaurant.destroy
    if @restaurant.destroy
      flash[:notice] = "Restaurand deleted !"
      redirect_to restaurants_path
    end
  end

end
