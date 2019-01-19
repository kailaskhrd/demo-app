class CategoriesController < ApplicationController

  def index
    category_list
  end

  def new
    @category = Category.new
    category_list
  end

  def create
    @category = Category.create(category_params)
    category_list
  end

  def edit
    @category = Category.find(params[:id])
    category_list
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    category_list
  end

  def delete
    @category = Category.find(params[:id])
    category_list
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    category_list
  end

  private
    def category_params
      params.require(:category).permit(:name, :rank, :parent_id)
    end

    def category_list
      @categories = Category.all
    end
end
