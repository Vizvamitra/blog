class Tag
  include Mongoid::Document
  field :value, type: Integer

  alias_method :name, :_id
  alias_method :count, :value
end
