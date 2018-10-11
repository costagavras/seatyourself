class ReservationsController < ApplicationController

  before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  before_action :find_restaurant, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    #display all reservations pertaining to current user
    @reservations = current_user.reservations.all
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

end
