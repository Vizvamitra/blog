xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Coder's vault"
    xml.author "Vizvamitra"
    xml.description "Blog"
    xml.link root_url
    xml.language "ru"

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.author article.author.name.capitalize
        xml.pubDate article.published_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.guid article.id
        xml.description render(partial: article.snippets.first, as: 'snippet')
      end
    end
  end
end