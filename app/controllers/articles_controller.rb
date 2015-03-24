class ArticlesController < ApplicationController

  before_action :set_tags, only: [:index, :show]

  def index
    @query = params[:tags]
    @articles = Article.published.tagged(@query).recent.page(params[:page]).per(5)
  end

  def show
    @article = Article.published.find(params[:id])
  end

  def feed
    @articles = Article.published.recent
  end

end
