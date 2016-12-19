class Api::V1::Comments::CommentsController < ApplicationController
  before_filter :restrict_access
  
  def index
    render json: Project.find_by_slug(params[:project]).comments
  end

  private
    def restrict_access
      head :unauthorized unless User.find_by_api_key(params[:api_key])
    end
end
