class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_category, :only=>[:new, :create]
  before_filter :find_board, :only=>[:show, :destroy]
	before_filter :viewable!, :only=>[:show]
  def index
    @boards = Board.all
  end

  def new
  end

  def create
    @board = Board.new(board_params)
		params[:board][:viewlist].each do |id, viewer|
			if viewer
				user = User.find_by(:account=>viewer)
				if !user.nil? then @board.viewlists.new(:user_id=>user.id) end
			end
		end
    if @board.save!
      redirect_to category_url(@category)
    else
      render :action => :new
    end
  end

  def show
  end

  def destroy
    @board.destroy
    redirect_to :back
  end

  private

	def viewable!
		if @board.users.include?(current_user) or current_user.admin?
			@posts = @board.posts
			@category = @board.category_id
			render :action=>:show
		else
			redirect_to :back
		end
	end
  
  def find_category
    @category = Category.find(params[:category_id])
  end

  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:category_id, :name)
  end
    
end
