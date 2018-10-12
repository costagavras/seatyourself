class SessionsController < ApplicationController
  layout 'user_portal'

  def new
    flash[:previous_page] = request.referer
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if flash[:previous_page] && flash[:previous_page] != new_user_url && flash[:previous_page] != new_session_url
        redirect_to flash[:previous_page], notice: "Logged in!"
      else
        redirect_to root_path, notice: "Logged in!"
      end
    else
      redirect_to new_session_path, notice: "*Not a valid username or password, please try again"
    end
  end

  def destroy
    session[:user_id] = nil
    if request.referer
      redirect_to request.referer, notice: "Logged out!"
    else
      redirect_to root_url, notice: "Logged out!"
    end
  end
end
