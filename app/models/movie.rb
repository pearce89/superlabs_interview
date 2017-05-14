class Movie
  include Neo4j::ActiveNode

  property :title, type: String
  property :year, type: Date
  property :genre, type: String
  property :studio, type: String
  property :price, type: Integer

  validates :title, presence: true
  validates :price, numericality: { only_integer: true }
end
