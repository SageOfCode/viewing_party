require "rails_helper"

RSpec.describe MovieObject do
  before :each do
    @test_movie = {title: "Test_movie",
              vote_average: 10,
              runtime: 106,
              genres: [{:id=>10749, :name=>"Romance"}, {:id=>16, :name=>"Animation"}, {:id=>18, :name=>"Drama"}],
              overview: "Tots Awesome Movie",
              credits: {cast: [{name: "Ryunosuke Kamiki", character: "Taki Tachibana (voice)"}, {name: "Ryunosuke Kamiki", character: "Baka Monikso (voice)"}, {name: "Kazuhiko Inoue", character: "Taki's father (voice)"}]},
              reviews: {results: {author: "Jose Lopes", content: "Amazing"}},
              images: {backdrops: [{file_path: "/mMtUybQ6hL24FXo0F3Z4j2KG7kZ.jpg"}]}
            }
    @movie = MovieObject.new(@test_movie)
  end
  describe "methods" do
    it "attr_readers" do
      expect(@movie.title).to eq("Test_movie")
      expect(@movie.vote_average).to eq(10)
      expect(@movie.runtime).to eq(106)
      expect(@movie.genres).to eq(@test_movie[:genres])
      expect(@movie.overview).to eq("Tots Awesome Movie")
      expect(@movie.cast).to eq(@test_movie[:credits][:cast])
      expect(@movie.reviews).to eq(@test_movie[:reviews][:results])
      expect(@movie.image).to eq("/mMtUybQ6hL24FXo0F3Z4j2KG7kZ.jpg")
    end

    it "detail_genres" do
      expected = ["Romance","Animation","Drama"]
      expect(@movie.detail_genres).to eq(expected)
    end

    it "detail_cast" do
      expected = "Taki Tachibana (voice),Baka Monikso (voice)"
      expected_2 = "Taki's father (voice)"
      expect(@movie.detail_cast["Ryunosuke Kamiki"]).to include(expected)
      expect(@movie.detail_cast["Kazuhiko Inoue"]).to include(expected_2)
    end

    it "detail_runtime" do
      expect(@movie.detail_runtime).to eq("1hr 46 min")

      @test_movie[:runtime] = 46
      movie = MovieObject.new(@test_movie)
      expect(movie.detail_runtime).to eq("46 min")
    end
  end
end
