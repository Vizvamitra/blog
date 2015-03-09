class PostsController < ApplicationController

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

end
