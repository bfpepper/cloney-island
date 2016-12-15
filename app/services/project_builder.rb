class ProjectBuilder
  attr_reader :name, :description, :goal, :slug, :category

  def initialize(project)
    @name = project["name"]
    @description = project["description"]
    @goal = project["goal"]
    @slug = generate_slug(name)
    @category = project["category_id"]
  end

  def generate_slug(name)
    name.parameterize
  end

  def build
    Project.new(name: name, description: description, goal: goal, slug: slug, category_id: category)
  end

end
