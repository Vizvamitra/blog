module Snippets
  class Text < Snippet
    field :body, type: String

    validates_presence_of :body
  end
end

Snippets::Text