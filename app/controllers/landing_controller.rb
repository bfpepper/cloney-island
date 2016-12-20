class LandingController < ApplicationController

  def index
    @projects = Project.all 
  end

end
