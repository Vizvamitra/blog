class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :author, type: String
  field :title, type: String
  field :published, type: Boolean
  field :published_at, type: DateTime
  field :expires_at, type: DateTime
  field :tags, type: Array
  field :body, type: String

  include Publishable

  belongs_to :user, primary_key: :name, foreign_key: :author

  validates_presence_of :title, :body
end
