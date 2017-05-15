class ReviewsController < ApplicationController
  respond_to :json

  def create
    update_rating = Movies::UpdateRating.run(params.require(:review).permit!)
    @review = update_rating.result[:review]
    @movie  = update_rating.result[:movie]
  end
end
