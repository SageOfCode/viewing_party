require "rails_helper"

RSpec.describe MovieObject do
  before :each do
    @test_movie = {title: "Test_movie",
              vote_average: 10,
              runtime: 106,
              genres: [{:id=>10749, :name=>"Romance"}, {:id=>16, :name=>"Animation"}, {:id=>18, :name=>"Drama"}],
              overview: "Tots Awesome Movie",
              credits: {cast: [{name: "Ryunosuke Kamiki", character: "Taki Tachibana (voice)"}, {name: "Ryunosuke Kamiki", character: "Baka Monikso (voice)"}, {name: "Kazuhiko Inoue", character: "Taki's father (voice)"}]},
              reviews: {author: "Jose Lopes", content: "Amazing"}
            }
    @movie = MovieObject.new(@test_movie)
  end
  describe "methods" do
    it "detail_genres" do
      expected = ["Romance","Animation","Drama"]
      expect(@movie.detail_genres).to eq(expected)
    end

    it "detail_cast" do
      expect(@movie.detail_cast).to include("Ryunosuke Kamiki")
      expect(@movie.detail_cast).to include("Kazuhiko Inoue")
    end

    it "detail_runtime" do
      expect(@movie.detail_runtime).to eq("1hr 46 min")

      @test_movie[:runtime] = 46
      movie = MovieObject.new(@test_movie)
      expect(movie.detail_runtime).to eq("46 min")
    end
  end
end
