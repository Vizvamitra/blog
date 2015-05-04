class Snippet
  include Mongoid::Document

  embedded_in :article

  def to_partial_path
    "shared/snippets/#{self.class.name.demodulize.underscore}"
  end
end