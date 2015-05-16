class SetPositionsToSnippets < Mongoid::Migration
  def self.up
    Article.all.each do |article|
      article.snippets.each_with_index do |snippet, i|
        snippet.position = i
      end
      article.save
    end
  end

  def self.down
  end
end