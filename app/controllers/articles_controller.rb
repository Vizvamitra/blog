class ArticlesController < ApplicationController
  respond_to :html

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.published.page(params[:page]).per(10)
  end

  def show
    @article = Article.find(params[:id])
    authorize! :read, @article
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params.merge(author: current_user.id))
    @article.save
    respond_with(@article)
  end

  def update
    @article.update_attributes(article_params)
    respond_with(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tags, :published, :published_at, :expires_at)
  end

  def set_article
    @article = Article.find(params[:id])
    authorize! :manage, @article
  end

end
