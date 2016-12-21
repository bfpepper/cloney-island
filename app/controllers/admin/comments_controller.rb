class Admin::CommentsController < ApplicationController

  def destroy
		comment = Comment.find(params[:id])
		project = comment.project
		comment.destroy
		redirect_to project_path(project.slug)
	end
  
end
