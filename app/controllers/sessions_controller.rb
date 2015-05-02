class SessionsController < Devise::SessionsController

  def new
    set_meta_tags SeoInfo.new.for_login_page
    super
  end

end