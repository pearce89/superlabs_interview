class MoviesController < ApplicationController
  def index
    @movies = Movie.all.page params[:page]
  end

  def show
    @movie = Movie.find_by(uuid: params[:id])
  end
end
