module ReviewsHelper
  def link_to_review_rating(rating)
    rating += 1
    css_class = if @movie.rating(current_user) && @movie.rating(current_user) >= rating
      'btn btn-warning btn-sm'
    else
      'btn btn-default btn-grey btn-sm'
    end

    link_to [@movie,
             :reviews,
             review: {
               movie: @movie,
               user: current_user,
               rating: rating
             }],
             method: :post, remote: true,
             class: css_class do
      raw('<span class="glyphicon glyphicon-star" aria-hidden="true"></span>')
    end
  end
end
