class Comment
  include Neo4j::ActiveNode
  property :body, type: String
  has_one :out, :movie, type: :movie
  has_one :out, :user,  type: :user

end
