class Users::AddUserController < ApplicationController

  def update
    user = User.find_by(email: params[:add_user][:new_owner_email])
    if User.exists?(user.id)
      project = Project.find(params[:add_user][:project_id])
      project.users << user
      redirect_to project_path(project)
    else
      flash[:danger] = "That user does not exist. Please enter a valid email."
      render 'projects/edit'
    end
  end

end
