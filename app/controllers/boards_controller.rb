class BoardsController < ApplicationController
  before_filter :find_category, :only => [:new, :create]
  before_filter :find_board, :only => [:show, :destroy]
  def index
    @boards = Board.all
  end

  def new
  end

  def create
    @board = Board.new(board_params)
    if @board.save!
      redirect_to category_url(@category)
    else
      render :action => :new
    end
  end

  def show
    @posts = @board.posts
    @category = @board.category_id
  end

  def destroy
    @board.destroy
    redirect_to :back
  end

  private
  
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
