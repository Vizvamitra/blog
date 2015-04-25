module ApplicationHelper

  def active_if_path path
    {class: request.fullpath == path ? 'active' : ''}
  end

end
