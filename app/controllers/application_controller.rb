class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :current_user_api_key

  before_action :authorize!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_api_key
    current_user.api_key if current_user
  end

  def logged_in?
    current_user
  end

  def authorize!
    unless authorized?
      render file: "/public/404.html"
    end
  end

  def authorized?
    PermissionsService.new(current_user, params[:controller], params[:action]).allow?
  end
end
