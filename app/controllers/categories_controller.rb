class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, :only => [:show, :destroy]
  def index
    @categories = Category.all
  end

  def new
  end

  def create
		@category = current_user.categories.new(category_params)
    if @category.save!
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def show
    @boards = @category.boards
  end

  def destroy
    @category.destroy
    redirect_to :back
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
end
