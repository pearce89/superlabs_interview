module MoviesHelper
  def movie_rating(movie, user = nil)
    html = ''
    if movie && movie.rating(user)
      movie.rating(user).round.times do
        html << '<span class="glyphicon glyphicon-star"></span>'
      end

      (5 - movie.rating(user).round).times do
        html << '<span class="glyphicon glyphicon-star-empty"></span>'
      end
    end

    raw(html)
  end
end
