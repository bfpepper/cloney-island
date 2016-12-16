class PermissionsService
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def allow?
    if user.admin?
      return true if controller == "admin/categories" && action.in?(%w(new edit index create update))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
    elsif user.registered?
      return true if controller == "projects" && action.in?(%w(new create show edit update))
      return true if controller == "users" && action.in?(%w(show edit update))
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "landing" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
    else
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "projects" && action == "show"
      return true if controller == "users" && action.in?(%(new create))
      return true if controller == "landing" && action == "index"
    end
  end

  private
    attr_reader :user, :controller, :action
end
