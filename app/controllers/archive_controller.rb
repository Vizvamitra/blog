class ArchiveController < ApplicationController

  before_action :set_tags, only: [:show]
  
  # GET /archive
  def show
    @articles = Article.published.recent
    set_meta_tags title: 'Архив'
  end

end
