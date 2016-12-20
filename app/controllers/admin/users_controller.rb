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
    else
      user.active!
    end
    redirect_to admin_users_path
    flash[:success] = "#{user.name} has been taken off line. Reason: #{user.reason_for_status_change}"
  end

end
