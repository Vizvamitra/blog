module ApplicationHelper

  def active_if_path path
    {class: request.fullpath == path ? 'active' : ''}
  end

  def keyword_tag tag
    content_tag(:span, tag, itemprop: 'keywords')
  end

end
