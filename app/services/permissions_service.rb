class PermissionsService
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def allow?
    if user.admin?
      admin_permissions
    elsif user.registered?
      registered_user_permissions
    else
      guest_permissions
    end
  end

  private
    attr_reader :user, :controller, :action

    def admin_permissions
      return true if controller == "admin/categories" && action.in?(%w(new edit index create update))
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "about" && action == "index"
    end

    def registered_user_permissions
      return true if controller == "projects" && action.in?(%w(new create show edit update))
      return true if controller == "users" && action.in?(%w(show edit update))
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "landing" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "about" && action == "index"
      return true if controller == "projects/pledges" && action.in?(%w(new create))
      return true if controller == "api/v1/comments" && action.in?(%w(index create))
    end

    def guest_permissions
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "sessions" && action.in?(%w(new create destroy guest))
      return true if controller == "projects" && action == "show"
      return true if controller == "users" && action.in?(%(new create))
      return true if controller == "landing" && action == "index"
      return true if controller == "about" && action == "index"
      return true if controller == "api/v1/comments" && action.in?(%w(index create))
    end
end
