class PermissionsService
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def allow?
    if user.admin?
      admin_permissions
    elsif user.banned?
      banned_permissions
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
			return true if controller == "admin/comments" && action == "destroy"
			return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "about" && action == "index"
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "landing" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "about" && action == "index"
      return true if controller == "projects/pledges" && action.in?(%w(new create))
      return true if controller == "users" && action.in?(%(show))
      return true if controller == "admin/users" && action.in?(%(index edit update))
      return true if controller == "projects" && action.in?(%w(new create show edit update))
      return true if controller == 'api' && action == "index"
    end

    def registered_user_permissions
      return true if controller == "projects" && action.in?(%w(new create show edit update))
      return true if controller == "users/add_user" && action == "update"
      return true if controller == "users" && action.in?(%w(show edit update))
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "landing" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "about" && action == "index"
      return true if controller == "projects/pledges" && action.in?(%w(new create))
      return true if controller == "api/v1/projects/comments" && action.in?(%w(index create))
      return true if controller == 'api' && action == "index"
    end

    def banned_permissions
      return true if controller == "projects" && action.in?(%w(show))
      return true if controller == "users" && action.in?(%w(show edit update))
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "landing" && action == "index"
      return true if controller == "sessions" && action.in?(%w(new create destroy))
      return true if controller == "about" && action == "index"
      return true if controller == 'api' && action == "index"
    end

    def guest_permissions
      return true if controller == "categories" && action.in?(%(show index))
      return true if controller == "sessions" && action.in?(%w(new create destroy guest))
      return true if controller == "projects" && action == "show"
      return true if controller == "users" && action.in?(%(new create))
      return true if controller == "landing" && action == "index"
      return true if controller == "about" && action == "index"
      return true if controller == "api/v1/projects/comments" && action.in?(%w(index create))
      return true if controller == "password" && action.in?(%(confirm find_user edit update))
      return true if controller == 'api' && action == "index"
    end
end
