class ArticlesController < ApplicationController

  def index
    @articles = Article.published.recent.page(params[:page]).per(10)
  end

  def show
    @article = Article.published.find(params[:id])
  end

  def feed
    @articles = Article.published.recent
  end

end
