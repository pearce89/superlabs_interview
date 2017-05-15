class Comment
  include Neo4j::ActiveNode
  property :body, type: String
  property :updated_at
  property :created_at

  validates :body, presence: true

  has_one :out, :movie, type: :movie
  has_one :out, :user,  type: :user

end
