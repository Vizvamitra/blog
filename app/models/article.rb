class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  field :author, type: String
  field :title, type: String
  field :description, type: String
  field :body, type: String
  field :tags, type: Array, default: []
  field :published, type: Boolean, default: false
  field :published_at, type: DateTime
  field :expires_at, type: DateTime
  slug  :title, history: true

  include Publishable

  belongs_to :author, class_name: 'User'
  embeds_many :snippets, cascade_callbacks: true

  accepts_nested_attributes_for :snippets, allow_destroy: true

  validates_presence_of :title, :author
  validates_length_of :snippets, minimum: 1

  scope :recent, ->{order(published_at: :desc)}
  scope :tagged, ->(tags){ tags.nil? ? all : all_in(tags: tags) }

  after_save do
    ::RecalculateTagsJob.perform_later
  end

end