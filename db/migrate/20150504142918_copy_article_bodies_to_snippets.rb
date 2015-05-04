class CopyArticleBodiesToSnippets < Mongoid::Migration
  def self.up
    Article.each do |article|
      preview, body = article.body.split('[more][/more]')

      snippets = [preview, body].compact.map do |text|
        Snippets::Text.new(body: text)
      end

      article.update(snippets: snippets)
    end
  end

  def self.down
    Article.update_all(snippets: [])
  end
end