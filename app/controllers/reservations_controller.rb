class ReservationsController < ApplicationController

  def index
    #display all reservations pertaining to current user
    @reservations = User.find_by(id: current_user.user_id).reservations
  end

  def show
    @reservation = Reservation.find_by(:id params[:id])
  end

  def new
    #display a form to create a new reservation linking a user to a resteraunt
    @reservation = Reservation.new
  end

  def create
    #create the new reservation based on user input
    @reservation = Reservation.new(datetime: =  params[:reservation][:datetime],
                                   party_size: =  params[:reservation][:party_size],
                                   user_id: =  params[:user_id],
                                   restaurant_id: = params[:restaurant_id])

    if @reservation.save
        flash[:notice] = "Your reservation was made sucessfully"
        redirect_to resteraunt_path
    else
        @reservation.errors.full_messages
        render :new
    end

  end

  def edit
    #display form with reservation object for user to edit
    @reservation = Reservation.find_by(id: params[:id])
  end

  def update
    @reservation = Reservation.new(datetime: =  params[:reservation][:datetime],
                                   party_size: =  params[:reservation][:party_size],
                                   user_id: =  params[:user_id],
                                   restaurant_id: = params[:restaurant_id])
    if @reservation.save
      flash[:notice] = "Your reservation was made sucessfully"
                                       redirect_to resteraunt_path
    else
      @reservation.errors.full_messages
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])

    if @reservation.destroy
      flash[:notice] = "Your reservation was sucessfully cancelled"
      redirect_to reservations_path
    else
      flash[:notice] = "Something went wrong we could not delete your reservation"
      render :show
    end

  end

end
