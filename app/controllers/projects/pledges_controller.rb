class Projects::PledgesController < ApplicationController
  def new
    @project = Project.find_by_slug(params[:slug])
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.create(pledge_params)
    if @pledge.save
      current_user.roles << Role.find_by(name: "backer")
      flash[:success] = "You've successfully backed #{@pledge.project.title}!"
      redirect_to project_path(@pledge.project.slug)
    else
      render :new
    end
  end

  private
    def pledge_params
      params.require(:pledge).permit(:amount_given).merge(user_and_project)
    end

    def user_and_project
      {user: current_user, project: Project.find_by_slug(params[:slug])}
    end
end
