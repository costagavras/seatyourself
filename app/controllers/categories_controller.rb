class CategoriesController < ApplicationController
  def index
    @categories = Categories.all
  end

  def new
    @category = Category.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
