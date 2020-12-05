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
  end
end
