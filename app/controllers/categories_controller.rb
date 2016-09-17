class CategoriesController < ApplicationController
  before_action :find_category, :only => []
  def index
    @categories = Category.all
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
end
