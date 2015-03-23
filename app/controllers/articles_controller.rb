class ArticlesController < ApplicationController

  def index
    @query = params[:tags]
    @articles = Article.published.tagged(@query).recent.page(params[:page]).per(5)
    @tags = Tag.order(value: :desc).limit(10)
  end

  def show
    @article = Article.published.find(params[:id])
  end

  def feed
    @articles = Article.published.recent
  end

end
