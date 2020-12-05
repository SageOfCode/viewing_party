require "rails_helper"

RSpec.describe MovieApiService do

  it "should exist" do
    api = MovieApiService.new
    api.should be_an_instance_of MovieApiService
  end

  describe "methods" do
    VCR.use_cassette("movies_search") do

      # it "conn" do
      #   api = MovieApiService.new
      #   expect(api.conn).to eq(Faraday.class)
      # end

      it "movies" do
        api = MovieApiService.new
        movies = api.movies("star")
        expect(movies.count).to eq(40)
      end
    end
  end
end
