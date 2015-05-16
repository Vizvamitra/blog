class Snippet
  include Mongoid::Document
  include Mongoid::Orderable
  orderable base: 0

  embedded_in :article

  default_scope ->{ order(position: :asc) }

  def to_partial_path
    "shared/snippets/#{self.class.name.demodulize.underscore}"
  end

  def as_json opts={}
    attributes.merge({"_id" => _id.to_s, isNewRecord: new_record?})
  end
end