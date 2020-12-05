require "faraday"

class MovieApiService


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
