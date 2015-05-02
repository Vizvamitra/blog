class SeoInfo
  include Rails.application.routes.url_helpers

  SITE_NAME = 'Vizvamitra\'s blog'

  def global
    {
      site: SITE_NAME,
      author: 'https://plus.google.com/116744773779971246072/',
      og: {
        image: "#{root_url}og_image.jpg",
        'image:type' => 'image/jpg',
        'image:width' => 200,
        'image:height' => 200
      }
    }
  end

  def for_article_index collection, params
    {
      title: 'Записи',
      next: (collection.last_page? ? '' : root_url(tags: params[:tags], page: collection.next_page)),
      prev: (collection.first_page? ? '' : root_url(tags: params[:tags], page: collection.prev_page)),
      og: {
        title: SITE_NAME,
        description: 'О веб-технологиях, учёбе и всём техническом, что придёт мне на ум',
        url: root_url,
        type: 'website',
      }
    }
  end

  def for_article article
    {
      title: article.title,
      description: article.description || article.title,
      keywords: article.tags,
      og: {
        title: article.title,
        description: :description,
        url: article_url(article),
        type: 'article',
        locale: 'ru_RU',
        site_name: SITE_NAME
      },
      article: {
        published_time: article.published_at.try(:iso8601),
        modified_time: article.updated_at.try(:iso8601),
        expiration_time: article.expires_at.try(:iso8601),
        author: article.author.name,
        tag: article.tags
      }
    }
  end

  def for_login_page
    { title: 'Вход' }
  end

end