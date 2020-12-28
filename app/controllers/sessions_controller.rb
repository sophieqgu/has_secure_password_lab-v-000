class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    redirect_to login_path unless @user.authenticate(params[:password])
    session[:name] = params[:name]
    redirect_to root_path
  end

  def destroy
    session.delete :name
    redirect_to root_path
  end


end
