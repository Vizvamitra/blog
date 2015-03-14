class Users::ArticlesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = current_user.articles.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.save
    respond_with @article, location: current_user_article_path(@article.id)
  end

  def update
    @article.update_attributes(article_params)
    respond_with @article, location: current_user_article_path(@article.id)
  end

  def destroy
    @article.destroy
    redirect_to current_user_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tags, :published, :published_at, :expires_at)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end


end
