class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :author, type: String
  field :title, type: String
  field :published, type: Boolean
  field :tags, type: Array
  field :body, type: String

  belongs_to :user, primary_key: :name, foreign_key: :author

  validates_presence_of :title, :body
end
