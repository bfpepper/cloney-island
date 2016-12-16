class ProjectsController < ApplicationController

  def new
    @project = Project.new
    @categories = Category.all
  end

  def show
    @project = Project.find_by_slug(params[:slug])
  end

  def create
    @project = ProjectBuilder.new(project_params).build
    if @project.save
      @project.users << current_user
      redirect_to project_path(slug: @project.title.parameterize)
    else
      redirect_to new_project_path
    end
  end

  def edit
    @project = Project.find_by(slug: params[:slug])
    @categories = Category.all
  end

  def update
    initial_project = Project.find(params[:slug])
    @project = ProjectBuilder.new(initial_project).modify(project_params, initial_project.id)
    if @project.save
      redirect_to project_path(slug: @project.title.parameterize)
    else
      @categories = Category.all
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :goal, :slug, :category_id)
  end
end
