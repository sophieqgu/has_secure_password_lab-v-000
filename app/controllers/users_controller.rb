class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    redirect_to root_path

  end

  def invalid_params
    !params[:name] || params[:name] = '' || !params[:password] || params[:password] = ''
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
