require "rails_helper"

RSpec.describe SearchFacade do
  it "movie_info method" do
    VCR.use_cassette("movie_details") do
      facade = SearchFacade.movie_info(372058)
      expect(facade).to be_an(MovieObject)
      expect(facade.title).to eq("Your Name.")
      expect(facade.detail_runtime).to eq("1hr 46 min")
      expect(facade.detail_genres).to eq(["Romance", "Animation", "Drama"])
    end
  end

  it "movie_search method" do
    VCR.use_cassette("movies_search") do
      facade = SearchFacade.movie_search("star")
      expect(facade).to be_an(Array)
      expect(facade[0][:title]).to eq("Star Wars")
      expect(facade[25][:title]).to eq("Robot Chicken: Star Wars")
    end
  end

  it "top_movies method" do
    VCR.use_cassette("top_rated") do
      facade = SearchFacade.top_movies
      expect(facade).to be_an(Array)
      expect(facade[0][:title]).to eq("Gabriel's Inferno Part III")
      expect(facade[30][:title]).to eq("Mortal Kombat Legends: Scorpion's Revenge")
    end
  end
end
