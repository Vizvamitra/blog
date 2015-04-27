class CurrentUser::ArticlesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = scoped_collection.page(params[:page]).per(10)
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
    respond_with @article, location: redirect_path
  end

  def update
    @article.update_attributes(article_params)
    respond_with @article, location: redirect_path
  end

  def destroy
    @article.destroy
    redirect_to current_user_articles_path
  end

  private

  def scoped_collection
    scopes = ['all', 'published', 'not_published']
    scope = scopes.include?(params[:scope]) ? params[:scope] : 'all'
    current_user.articles.recent.send(scope)
  end

  def article_params
    params.require(:article).permit(:title, :body, :published, :published_at, :expires_at, tags: [])
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def redirect_path
    current_user_article_path(@article) if @article.persisted?
  end

end
