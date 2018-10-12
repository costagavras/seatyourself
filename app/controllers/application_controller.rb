class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    session[:user_id] = nil
  end

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end
  end

  def wipe_user_id
    session[:user_id] = nil
  end

  helper_method :current_user
  helper_method :wipe_user_id
end
