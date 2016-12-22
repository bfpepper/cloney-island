class ProjectBuilder
  attr_reader :title, :description, :goal, :slug, :category_id, :banner_image

  def initialize(project)
    @title = project[:title]
    @description = project[:description]
    @goal = project[:goal]
    @slug = generate_slug(title)
    @category_id = project[:category_id]
    @banner_image = project[:banner_image]
  end

  def generate_slug(title)
    title.parameterize
  end

  def build
    Project.new(title: title, description: description, goal: goal, slug: slug, category_id: category_id, banner_image: banner_image)
  end

  def modify(project, id)
    update_project = Project.find(id)
    this  = update_project.assign_attributes(title: project[:title],
                                             description: project[:description],
                                             goal: project[:goal],
                                             slug: update_slug(project[:title]),
                                             category_id: project[:category_id],
                                             banner_image: project[:banner_image])
    return update_project
  end

  def update_slug(new_title)
    @slug = new_title.parameterize
  end

end
