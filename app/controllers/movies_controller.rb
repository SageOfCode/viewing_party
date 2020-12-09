class MoviesController < ApplicationController
  def index
    @movies = MovieApiService.top_rated_movies
  end

  def search 
    @movies = MovieApiService.movies(params[:movie])
  end

  def show 
    @movie = MovieApiService.movie_details(params[:movie_api_id])
  end
end
