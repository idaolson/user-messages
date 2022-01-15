class UsersController < ApplicationController
  skip_before_action :require_user

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    session[:user_id] = new_user.id
    flash[:success] = "Account created!"
    redirect_to dashboard_index_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation)
  end
end
