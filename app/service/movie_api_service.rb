require "faraday"

class MovieApiService

  def self.movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}") do |req|
      req.params[:append_to_response] = "credits,reviews,images"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_movies
    page = 1
    movies = []
    2.times do
      response = conn.get("/3/movie/top_rated") do |req|
        req.params[:page] = page
      end
      json_response = JSON.parse(response.body, symbolize_names: true)
      movies << json_response[:results]
      page += 1
    end
    movies.flatten!
  end

  def self.movies(query)
    page = 1
    movies = []
    2.times do
      response = conn.get("/3/search/movie?&page=#{page}") do |req|
        req.params[:query] = query
      end
      json_response = JSON.parse(response.body, symbolize_names: true)
      movies << json_response[:results]
      page += 1
    end
    movies.flatten!
  end

  private

  def self.conn
    Faraday.new("https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
  end
end
