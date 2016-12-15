class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "Successfully created #{@category.name}"
      redirect_to admin_categories_path(category: @category.slug)
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find_by_slug(params[:category])
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
