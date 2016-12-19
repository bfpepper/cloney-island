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

  def update
    if params[:password][:password] == params[:password][:password_confirmation]
      user = User.find_by(verification_code: params[:password][:twilio_response_code])
      user.update(password: params[:password][:password])
      redirect_to login_path
    else
      flash[:danger] = "Your passswords do not match. Please try again."
      render :edit
    end
  end
end
