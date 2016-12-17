class Projects::PledgesController < ApplicationController
  def new
    @project = Project.find_by_slug(params[:slug])
    @pledge = Pledge.new
  end

  def create
  end
end
