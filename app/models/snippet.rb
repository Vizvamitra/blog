class Snippet
  include Mongoid::Document

  embedded_in :article

  def to_partial_path
    "shared/snippets/#{self.class.name.demodulize.underscore}"
  end

  def as_json opts={}
    attributes.merge({"_id" => _id.to_s})
  end
end