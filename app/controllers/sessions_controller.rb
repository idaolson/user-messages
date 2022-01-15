class SessionsController < ApplicationController
  skip_before_action :require_user

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_index_path
    else
      flash[:error] = 'Log in failed.'
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
