require "rails_helper"

RSpec.describe MovieApiService do
  describe "methods" do
    it "movies" do
      VCR.use_cassette("movies_search") do
        movies = MovieApiService.movies("star")
        expect(movies).to be_an(Array)
        expect(movies.count).to eq(40)
        expect(movies[0][:title]).to eq("Star Wars")
        expect(movies[25][:title]).to eq("Robot Chicken: Star Wars")
      end
    end

    it "top_rated_movies" do
      VCR.use_cassette("top_rated") do
        movies = MovieApiService.top_rated_movies
        expect(movies).to be_an(Array)
        expect(movies.count).to eq(40)
        expect(movies[0][:title]).to eq("Gabriel's Inferno Part III")
        expect(movies[30][:title]).to eq("Mortal Kombat Legends: Scorpion's Revenge")
      end
    end

    it "movie_details" do
      VCR.use_cassette("movie_details") do
        movie = MovieApiService.movie_details(372058)
        expect(movie[:title]).to eq("Your Name.")
        expect(movie[:runtime]).to eq(106)
        expect(movie[:vote_average]).to eq(8.6)
        expect(movie[:images][:backdrops][0][:file_path]).to eq("/mMtUybQ6hL24FXo0F3Z4j2KG7kZ.jpg")
        require "pry"; binding.pry
      end
    end
  end
end
