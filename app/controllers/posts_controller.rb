class PostsController < ApplicationController
  before_action :find_board, :only => [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @team = Team.find(params[:t])
    @group = Group.find(@team.group_id)
    @posts = Post.where(team_id: params[:t])
  end

  def new
  end

  def create
    @post = Post.new(newpost_params)
    if @post.save!
      redirect_to board_path(@board)
    else
       render :new
    end
  end

  def show
    @board = @post.board_id
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private

  def find_board
    @board = Board.find(params[:board_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def newpost_params
    params.permit(:title, :content, :board_id)
  end
end
