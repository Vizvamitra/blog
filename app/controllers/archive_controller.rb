class ArchiveController < ApplicationController

  before_action :set_tags, only: [:show]
  
  def show
    @articles = Article.published.recent
  end
end
