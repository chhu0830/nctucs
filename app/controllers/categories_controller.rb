class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, :only => [:show, :destroy]
  def index
    @categories = Category.all
		@csunions = Array.new()
		@cscamps = Array.new()
		@csolds = Array.new()
		@csnews = Array.new()
		@others = Array.new()
		@categories.each do |c|
			if c.name.include?("系學會")then @csunions << c
			elsif c.name.include?("資工營")then @cscamps << c
			elsif c.name.include?("系露營")then @csolds << c
			elsif c.name.include?("迎宿")then @csnews << c
			else @others << c
			end
		end

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
