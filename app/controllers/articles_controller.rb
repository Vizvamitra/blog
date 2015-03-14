class ArticlesController < ApplicationController

  def index
    @articles = Article.published.page(params[:page]).per(10)
  end

  def show
    @article = Article.published.find(params[:id])
  end

end
