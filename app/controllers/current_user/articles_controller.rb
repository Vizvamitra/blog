class CurrentUser::ArticlesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /users/current/articles
  def index
    @articles = scoped_collection.page(params[:page]).per(10)
    set_meta_tags title: index_page_title
  end

  # GET /users/current/articles/:id
  def show
    set_meta_tags title: @article.title
  end

  # GET /users/current/articles/new
  def new
    @article = Article.new
    set_meta_tags title: 'Новый пост'
  end

  # GET /users/current/articles/:id/edit
  def edit
    set_meta_tags title: @article.title
  end

  # POST /users/current/articles
  def create
    @article = current_user.articles.new(article_params)
    @article.save
    respond_with @article, location: redirect_path
  end

  # PATCH /users/current/articles/:id
  def update
    @article.update_attributes(article_params)
    respond_with @article, location: redirect_path
  end

  # DELETE /users/current/articles/:id
  def destroy
    @article.destroy
    redirect_to current_user_articles_path
  end

  private

  def index_page_title
    case params[:scope]
    when 'published' then 'Опубликованные'
    when 'not_published' then 'Не опубликованные'
    else 'Все посты'
    end
  end

  def scoped_collection
    scopes = ['all', 'published', 'not_published']
    scope = scopes.include?(params[:scope]) ? params[:scope] : 'all'
    current_user.articles.recent.send(scope)
  end

  def article_params
    params.require(:article).permit(:title, :body, :description, :published, :published_at, :expires_at, tags: [], snippets_attributes: [:_id, :_type, :_destroy, :body])
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def redirect_path
    current_user_article_path(@article) if @article.persisted?
  end

end
