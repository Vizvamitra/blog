module Snippets
  class Embed < Snippet
    field :body, type: String, default: ''

    validates_presence_of :body
  end
end

Snippets::Embed