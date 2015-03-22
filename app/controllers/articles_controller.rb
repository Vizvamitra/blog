class ArticlesController < ApplicationController

  def index
    @articles = index_collection.page(params[:page]).per(10)
  end

  def show
    @article = Article.published.find(params[:id])
  end

  def feed
    @articles = Article.published.recent
  end

  private

  def index_collection
    collection = Article.published.recent
    searching_by_tags? ? collection.in(tags: params[:tags]) : collection
  end

  def searching_by_tags?
    params[:tags].is_a?(Array) && params[:tags].present?
  end
end
