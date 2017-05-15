class Review
  include Neo4j::ActiveNode
  property :rating, type: Integer
  has_one :out, :movie, type: :movie
  has_one :out, :user,  type: :user

end
