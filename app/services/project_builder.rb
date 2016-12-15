class ProjectBuilder
  attr_reader :name, :description, :goal, :slug, :user

  def initialize(project)
    @user = project["user_id"]
    @name = project["name"]
    @description = project["description"]
    @goal = project["goal"]
    @slug = generate_slug(name)
  end

  def generate_slug(name)
    name.parameterize
  end

  def build
    Project.new(name: name, description: description, goal: goal, slug: slug, user_id: user)
  end

end
