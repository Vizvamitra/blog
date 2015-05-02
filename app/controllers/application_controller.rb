class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_global_seo_info, only: [:index, :show, :new, :edit]
  
  private

  def set_tags
    @tags = Tag.order(value: :desc).limit(10)
  end

  def set_global_seo_info
    set_meta_tags SeoInfo.new.global
  end
end
