class CategoriesController < ApplicationController
  before_action :set_categories, only: %I[show index]

  def show
    @category = Category.find(params[:id])
  end

  def index
    @category = Category.find(47)
    render :show
  end

  private

  def set_categories
    @categories = Category.all
  end
end
