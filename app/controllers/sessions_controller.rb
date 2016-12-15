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
      flash[:danger] = "Something went wrong!"
      redirect_to login_path
    end
  end

  def destroy
  session.delete(:user_id)
  flash[:success] = "You Successfully Logged out!"
  redirect_to root_path
end

end
