class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.active?
      user.banned!
      user_status_message(user, "taken off line")
    else
      user.active!
      user_status_message(user, "resurrected")
    end
  end

  private

  def user_status_message(user, status)
    redirect_to admin_users_path
    flash[:success] = "#{user.name} has been #{status}. Reason: #{user.reason_for_status_change}"
  end


end
