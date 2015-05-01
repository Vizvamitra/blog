class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_blog_info, only: [:index, :show, :new, :edit]
  
  private

  def set_tags
    @tags = Tag.order(value: :desc).limit(10)
  end

  def set_blog_info
    set_meta_tags(
      site: 'Vizvamitra\'s blog',
      author: 'https://plus.google.com/116744773779971246072/',
      og: {
        image: "#{root_url}og_image.jpg",
        'image:type' => 'image/jpg',
        'image:width' => 200,
        'image:height' => 200
      }
    )
  end
end
