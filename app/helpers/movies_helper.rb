module MoviesHelper
  def movie_rating(movie)
    html = ''
    if movie && movie.rating
      movie.rating.round.times do
        html << '<span class="glyphicon glyphicon-star"></span>'
      end

      (5 - movie.rating.round).times do
        html << '<span class="glyphicon glyphicon-star-empty"></span>'
      end
    end

    raw(html)
  end
end
