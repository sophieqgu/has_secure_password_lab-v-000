class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def invalid_params
    !params[:name] || params[:name] = '' || !params[:password] || params[:password] = ''
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
