class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:name] = params[:name]
      redirect_to root_path
    else
      redirect_to login_path
  end

  def destroy
    session.delete :name
    redirect_to root_path
  end


end
