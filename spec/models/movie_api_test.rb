require "rails_helper"

RSpec.describe MovieApiService do
  describe "methods" do
    it "movies" do
      VCR.use_cassette("movies_search") do
        movies = MovieApiService.movies("star")
        expect(movies).to be_an(Array)
        expect(movies.count).to eq(40)
      end
    end

    it "top_rated_movies" do
      VCR.use_cassette("top_rated") do
        movies = MovieApiService.top_rated_movies
        expect(movies).to be_an(Array)
        expect(movies.count).to eq(40)
      end
    end

    it "movie_details" do
      VCR.use_cassette("movie_details") do
        MovieApiService.movie_details(372058)
      end
    end
  end
end
