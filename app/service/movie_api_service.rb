class MovieApiService
  def conn
    api = Faraday.new("https://api.themoviedb.org/3/discover/") do |f|
      f.params["api_key"] = ENV["MOVIE_API_KEY"]
    end
    require "pry"
    binding.pry
  end
end
