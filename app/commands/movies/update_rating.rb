class Movies::UpdateRating
  include Tzu

  def call(params)
    movie  = Movie.find(params[:movie])
    user   = User.find(params[:user])
    review = Review.where(movie: movie, user: user).first || Review.new(params)
    review.rating = params[:rating].to_i
    review.save

    { review: review, movie: movie, user: user }
  end
end