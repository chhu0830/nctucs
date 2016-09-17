class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @team = Team.find(params[:t])
    @group = Group.find(@team.group_id)
    @posts = Post.where(team_id: params[:t])
  end

  def new
    @team_id = params[:t]
    @post = Post.new
  end

  def create
    @post = Post.new(newpost_params)
    if @post.save!
      redirect_to posts_path(t: @post.team_id)
    else
       render :new
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def newpost_params
    params.permit(:title, :content, :team_id)
  end
end
