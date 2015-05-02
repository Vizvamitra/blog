class ArticlesController < ApplicationController

  before_action :set_tags, only: [:index, :show]

  # GET / or /articles
  def index
    @query = params[:tags]
    @articles = Article.published.tagged(@query).recent.page(params[:page]).per(5)
    set_meta_tags SeoInfo.new.for_article_index(@articles, params)
  end

  # GET /articles/:id
  def show
    @article = Article.published.find(params[:id])
    set_meta_tags SeoInfo.new.for_article(@article)
  end

  # GET /articles/feed
  def feed
    @articles = Article.published.recent
  end

end