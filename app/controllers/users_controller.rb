class UsersController < ApplicationController
  before_action :confirm_user, only: [:show, :edit, :update]
  before_action :new_user, only: [:new, :create]
  before_action :username_email, only: [:create, :update]

  layout 'user_portal'

  def new
    flash[:previous_page] = request.referer
  end

  def create
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      session[:user_id] = @user.id
      if flash[:previous_page] && flash[:previous_page] != new_session_url
        redirect_to flash[:previous_page]
      else
        redirect_to root_path
      end
    else
      render new_user_path
    end
  end

  def show
    @reservations = Reservation.where(user_id: @user.id)

    if @user.restaurants
      @restaurants = @user.restaurants
    end
  end

  def edit
  end

  def update
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user

    Reservation.where(user_id: @user.id).each do |reso|
      reso.destroy
    end
    session[:user_id] = nil
    @user.destroy
    redirect_to root_path
  end

  private

  def new_user
    @user = User.new
  end

  def confirm_user
    if current_user
      @user = current_user
    else
      redirect_to root_path, notice: "You must be logged in to do that!"
    end
  end

  def username_email
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
  end

end
