class UsersController < ApplicationController
  def new
  end

  def create
    if !params.valid
      redirect_to login_path
    else
      @user = User.create(user_params)
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end 
end
