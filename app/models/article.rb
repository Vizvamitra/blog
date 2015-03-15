class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  field :author, type: String
  field :title, type: String
  field :body, type: String
  field :tags, type: Array
  field :published, type: Boolean
  field :published_at, type: DateTime
  field :expires_at, type: DateTime
  slug  :title, history: true

  include Publishable

  belongs_to :author, class_name: 'User'

  validates_presence_of :title, :body, :author

  scope :recent, ->{order(published_at: :desc)}

  after_save(if: :tags_changed?) do
    ::RecalculateTagsJob.perform_later
  end

end