class MoviesController < ApplicationController
  def index
    @movies = SearchFacade.top_movies
  end

  def search 
    @movies = SearchFacade.movie_search(params[:movie])
  end

  def show 
    @movie = SearchFacade.movie_info(params[:movie_api_id])
  end
end
