class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user and @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You Successfully Logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Email and password don't match"
      render :login
    end
  end

end
