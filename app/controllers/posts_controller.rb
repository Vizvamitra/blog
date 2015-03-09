class PostsController < ApplicationController
  respond_to :html

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index
    @posts = Post.published.page(params[:page]).per(10)
  end

  def show
    @post = Post.published.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(author: current_user.id))
    @post.save
    respond_with(@post, location: posts_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tags, :published, :published_at, :expires_at)
  end

end
