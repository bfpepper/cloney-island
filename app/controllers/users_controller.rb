class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Logged in as #{user.name}"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :phone,
                                 :email_confirmation,
                                 :password,
                                 :password_confirmation)
  end
end
