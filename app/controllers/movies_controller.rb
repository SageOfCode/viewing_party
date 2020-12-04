class MoviesController < ApplicationController
  def index
    conn = Faraday.new("https://api.themoviedb.org") do |f|
      f.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
    page = 1
    @movies = []
    2.times do
      response = conn.get('/3/discover/movie?sort_by=popularity.desc') do |req|
        req.params[:page] = page
      end
      test = JSON.parse(response.body, symbolize_names: true)
      @movies << test[:results]
      page += 1
    end
    @movies.flatten!
  end
end
