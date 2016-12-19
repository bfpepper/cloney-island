class Api::V1::CommentsController < ApplicationController
  before_filter :restrict_access

  def index
    project = Project.find_by_slug(params[:project])
    if project
      render json: project.comments
    else
      render json: {error: 'project not found'}, status: 404
    end
  end

  private
    def restrict_access
      render json: {error: 'unauthorized'}, status: 401 unless User.find_by_api_key(params[:api_key])
    end
end
