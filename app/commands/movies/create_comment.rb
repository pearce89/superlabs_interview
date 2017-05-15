class Movies::CreateComment
  include Tzu

  def call(params)
    movie  = Movie.find(params[:movie])
    user   = User.find(params[:user])

    comment = Comment.create(movie: movie, user: user, body: params[:body])

    { comment: comment, movie: movie, user: user }
  end
end