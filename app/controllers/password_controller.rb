require "confirmation_sender"

class PasswordController < ApplicationController

  def confirm
  end

  def find_user
    if User.exists?(email: params[:password][:email])
      user = User.find_by(email: params[:password][:email])
      ConfirmationSender.send_confirmation_to(user)
      redirect_to password_reset_path
    else
      flash[:danger] = "You didnt enter the right email"
      render :confirm
    end
  end

end
