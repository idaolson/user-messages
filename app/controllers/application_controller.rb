class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_user
  helper_method :current_user

  def require_user
    return if current_user

    redirect_to root_path
    flash[:notice] = "Sign in to access site"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
