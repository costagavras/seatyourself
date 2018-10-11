class UsersController < ApplicationController
  layout 'user_portal'

  def new
    @user = User.new
    flash[:previous_page] = request.referer
  end

  def create
    @user = User.new

    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
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
    if current_user
      @user = current_user
    end
  end
end
