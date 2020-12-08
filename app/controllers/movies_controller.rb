class MoviesController < ApplicationController
  def index
    @movies = MovieApiService.top_rated_movies
  end

  def search 
    @movies = MovieApiService.movies(params[:movie])
  end
end
