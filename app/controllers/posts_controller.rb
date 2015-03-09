class PostsController < ApplicationController

  def index
    @posts = Post.published.page(params[:page]).per(10)
  end

  def show
    @post = Post.published.find(params[:id])
  end

end
