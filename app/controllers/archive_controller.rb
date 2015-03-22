class ArchiveController < ApplicationController
  def show
    @articles = Article.published.recent
  end
end
