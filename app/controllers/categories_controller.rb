class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @pledges = Pledge.all.sum(:amount_given) 
  end

   def show
    @category = Category.find_by_slug(params[:category])
   end
end
