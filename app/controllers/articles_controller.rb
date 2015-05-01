class ArticlesController < ApplicationController

  before_action :set_tags, only: [:index, :show]

  # GET / or /articles
  def index
    @query = params[:tags]
    @articles = Article.published.tagged(@query).recent.page(params[:page]).per(5)
    set_meta_tags meta_tags_for_index
  end

  # GET /articles/:id
  def show
    @article = Article.published.find(params[:id])
    set_meta_tags meta_tags_for_show
  end

  # GET /articles/feed
  def feed
    @articles = Article.published.recent
  end

  private

  def meta_tags_for_index
    {
      title: 'Лента',
      next: (@articles.last_page? ? '' : articles_path(tags: params[:tags], page: @articles.next_page)),
      prev: (@articles.first_page? ? '' : articles_path(tags: params[:tags], page: @articles.prev_page))
    }
  end

  def meta_tags_for_show
    {
      title: @article.title,
      keywords: @article.tags,
      og: {
        title: @article.title,
        description: @article.title,
        type: 'article',
        url: article_url(@article),
        image: "#{root_url}/og_image.png",
        site_name: 'Vizvamitra\'s blog',
        locale: 'ru_RU',
        published_time: @article.published_at.try(:iso8601),
        modified_time: @article.updated_at.try(:iso8601),
        expiration_time: @article.expires_at.try(:iso8601),
        author: @article.author.name,
        tag: @article.tags,
      }
    }
  end

end
