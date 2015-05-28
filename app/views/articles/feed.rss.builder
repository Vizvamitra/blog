xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title "Vizvamitra's blog"
    xml.description "Vizvamitra's blog"
    xml.link root_url
    xml.pubDate DateTime.now.rfc2822
    xml.language "ru"
    xml.copyright "Copyright 2014-#{Date.today.year} Dmitrii Krasnov"
    xml.tag! 'atom:link', nil, href: feed_articles_url, rel: 'self', type: 'application/rss+xml'

    @articles.each do |article|
      xml.item do
        xml.title{ xml.cdata!(article.title) }
        xml.author article.author.name.capitalize
        xml.pubDate article.published_at.rfc2822
        xml.link article_url(article)
        xml.guid article_url(article), isPermalink: true
        xml.description do
          xml.cdata!(
            render(partial: article.snippets.first, as: 'snippet') + 
            "<div><a href=#{article_url(article)}>Читать далее</a></div>"
          )
        end
        xml.comments article_url(article, anchor: 'disqus_thread')
        article.tags.each do |tag|
          xml.category{ xml.cdata!(tag) }
        end
      end
    end
  end
end