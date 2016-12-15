class ProjectsController < ApplicationController

  def new
    @project = Project.new
    @categories = Category.all
  end

  def show
    @project = Project.find_by_slug(params[:project])
  end

  def create
    @project = ProjectBuilder.new(project_params).build
    if @project.save
      @project.users << current_user
      redirect_to project_path(project: @project.slug)
    else
      redirect_to new_project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :goal, :slug, :category_id)
  end
end
