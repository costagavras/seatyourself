class ReservationsController < ApplicationController

  def index
    #display all reservations pertaining to current user
    @reservations = current_user.reservations.all
    #@reservations = User.find_by(id: current_user.user_id).reservations
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @reservation = Reservation.find_by(id: params[:id])
  end

  def new
    #display a form to create a new reservation linking a user to a resteraunt
    @reservation = Reservation.new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end

  def create
    @reservation = Reservation.new(date_time:  params[:reservation][:date_time],
                                   party_size: params[:reservation][:party_size],
                                   user_id: current_user.id,
                                   restaurant_id: params[:restaurant_id])

    @resteraunt = Restaurant.find_by(id: params[:restaurant_id])

    if @reservation.save
        flash[:notice] = "Your reservation was made sucessfully"
        redirect_to restaurant_reservation_path(@resteraunt ,@reservation)
    else
        @reservation.errors.full_messages
        render :new
    end

  end

  def edit
    #display form with reservation object for user to edit
    @reservation = Reservation.find_by(id: params[:id])
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end

  def update
    @reservation = Reservation.find_by(id: params[:id])

    @reservation.date_time =  params[:reservation][:date_time];
    @reservation.party_size = params[:reservation][:party_size];
    @reservation.user_id = current_user.id;
    @reservation.restaurant_id = params[:restaurant_id];


    if @reservation.save
      flash[:notice] = "Your reservation was made sucessfully"
      redirect_to reservations_path
    else
      @reservation.errors.full_messages
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    @resteraunt = Restaurant.find_by(id: params[:restaurant_id])

    if @reservation.destroy
      flash[:notice] = "Your reservation was sucessfully cancelled"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong we could not delete your reservation"
      render :show
    end

  end

end
