class Post
  include Mongoid::Document
  field :title, type: String
  field :published, type: Mongoid::Boolean
  field :tags, type: Array
  field :body, type: String
end
