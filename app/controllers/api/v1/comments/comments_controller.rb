class Api::V1::Comments::CommentsController < ApplicationController
  before_filter :restrict_access
  
  def index
    project = Project.find_by_slug(params[:project])
    if project
      render json: project.comments
    else  
      render json: {error: 'project not found'}
    end
  end

  private
    def restrict_access
      head :unauthorized unless User.find_by_api_key(params[:api_key])
    end
end
