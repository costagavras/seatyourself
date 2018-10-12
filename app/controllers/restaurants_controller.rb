class RestaurantsController < ApplicationController
  def index
    @categories = Category.all
    @neighbourhoods = Neighbourhood.all

    if params[:price_range] == "nada" && params[:neighbourhood] == "nada" && params[:category] == "nada"
      @my_restaurants = Restaurant.all
    elsif(params[:price_range] == nil && params[:neighbourhood] == nil && params[:category] == nil)
      @my_restaurants = Restaurant.all
    else
      @my_restaurants = []


      params.each do |key, value|
        if(key == "neighbourhood" || key == "category" || key == "price_range")
          temp_search = Restaurant.where(key => value)
          temp_search.each do |entry|
            if @my_restaurants.include?(entry)

            else
              @my_restaurants << entry
            end
          end
        end
      end

    @filter_search = []
    params.each do |key, value|
      if key == "category" && value != "nada"
        @filter_search << Category.find_by(id: value).name
        @text_category = " restaurants,"
      elsif key == "neighbourhood" && value != "nada"
        @filter_search << Neighbourhood.find_by(id: value).name
        @text_neighbourhood = " neighbourhood,"
      elsif key == "price_range" && value != "nada"
        @filter_search << "$" * value.to_i
        @text_price_range = "price range"
      end
    end

    if @filter_search != []
      flash[:search_result] = "Your searched: #{@filter_search[0]} #{@text_category} #{@filter_search[1]} #{@text_neighbourhood} #{@filter_search[2]} #{@text_price_range}"
    end
    @filter_search = []

    end

  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all
    @neighbourhoods = Neighbourhood.all
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
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    if @restaurant.destroy
      flash[:notice] = "Restaurand deleted !"
      redirect_to restaurants_path
    end
  end

end
