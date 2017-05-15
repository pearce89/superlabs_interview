class Movies::GetRating
  include Tzu

  def call(params)
    @user  = params[:user]
    @movie = params[:movie]

    if @user
      return @movie.reviews.where(user: @user).first.try(:rating)
    end

    if @movie.reviews.count > 0
      (@movie.reviews.sum(&:rating) / @movie.reviews.count.to_f).round(2)
    else
      nil
    end
  end
end