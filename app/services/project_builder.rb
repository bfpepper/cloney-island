class ProjectBuilder
  attr_reader :title, :description, :goal, :slug, :category_id

  def initialize(project)
    @title = project[:title]
    @description = project[:description]
    @goal = project[:goal]
    @slug = generate_slug(title)
    @category_id = project[:category_id]
  end

  def generate_slug(title)
    title.parameterize
  end

  def build
    Project.new(title: title, description: description, goal: goal, slug: slug, category_id: category_id)
  end

end
