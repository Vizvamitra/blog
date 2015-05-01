class SessionsController < Devise::SessionsController

  def new
    set_meta_tags title: 'Вход'
    super
  end

end