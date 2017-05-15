class Movie
  include Neo4j::ActiveNode

  property :title, type: String
  property :year, type: Date
  property :genre, type: String
  property :studio, type: String
  property :price, type: Integer

  has_many :in, :reviews, origin: :movie
  has_many :in, :comments, origin: :movie

  validates :title, presence: true
  validates :price, numericality: { only_integer: true }

  def rating(user = nil, movie = self)
    Movies::GetRating.run({ movie: movie, user: user }).result
  end
end
