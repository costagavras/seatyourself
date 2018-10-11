class ReservationsController < ApplicationController

  before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :check_reservation_date, only: [:create, :update]
  before_action :check_restaurant_capacity, only: [:create, :update]
  before_action :check_restaurant_operating_hours, only: [:create, :update]


  def index
    #display all reservations pertaining to current user
    @reservations = Reservation.all
  end

  def show
  end

  def new
    #display a form to create a new reservation linking a user to a resteraunt
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(date_time:  params[:reservation][:date_time],
                                   party_size: params[:reservation][:party_size],
                                   user_id: current_user.id,
                                   restaurant_id: params[:restaurant_id])

    if @reservation.save
        flash[:notice] = "Your reservation was made sucessfully"
        redirect_to restaurant_reservation_path(@restaurant ,@reservation)
    else
        @reservation.errors.full_messages
        render :new
    end

  end

  def edit
    #display form with reservation object for user to edit
  end

  def update
    @reservation.date_time =  params[:reservation][:date_time];
    @reservation.party_size = params[:reservation][:party_size];
    @reservation.user_id = current_user.id;
    @reservation.restaurant_id = params[:restaurant_id];

    if @reservation.save
      flash[:notice] = "Your reservation was made sucessfully"
      redirect_to restaurant_reservation_path(@restaurant ,@reservation)
    else
      @reservation.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @reservation.destroy
      flash[:notice] = "Your reservation was sucessfully cancelled"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong we could not delete your reservation"
      render :show
    end
  end

  #####Before action functions to clean up code###########
  def find_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end

  #check if date is in the past
  def check_reservation_date
    reservation_date_time = params[:reservation][:date_time].split('T')
    reservation_date = reservation_date_time[0].split('-')
    reservation_date_object = Time.new(reservation_date[0].to_i, reservation_date[1].to_i, reservation_date[2].to_i)

    if(reservation_date_object < Time.now)
      flash[:notice] = "Reservation cannot be made in the past :("
      redirect_to new_restaurant_reservation_path
    end
  end

  def check_restaurant_capacity
    restaurant = find_restaurant

    current_reservations = restaurant.reservations
    restaurant_capacity = restaurant.capacity

    puts "---------------"
    p restaurant_capacity

    current_reservations.each do |reservation|
      restaurant_capacity -= reservation.party_size
    end

    p restaurant_capacity
    puts "---------------"

    if(restaurant_capacity < params[:reservation][:party_size].to_i)
      flash[:notice] = "This Restaurant is fully booked :("
      redirect_to new_restaurant_reservation_path
    end
  end

  def check_restaurant_operating_hours

  end

end
