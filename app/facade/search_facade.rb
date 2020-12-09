class SearchFacade
  def self.movie_info(movie_id)
    response = MovieApiService.movie_details(movie_id)
    MovieObject.new(response)
  end

  def self.movie_search(movie)
    MovieApiService.movies(movie)
  end

  def self.top_movies
    MovieApiService.top_rated_movies
  end
end
