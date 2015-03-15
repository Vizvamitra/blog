class Article
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

  belongs_to :author, class_name: 'User'

  validates_presence_of :title, :body, :author

  scope :recent, ->{order(published_at: :desc)}

  after_save(if: :tags_changed?) do
    ::RecalculateTagsJob.perform_later
  end

end
