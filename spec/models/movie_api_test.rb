require "./app/service/movie_api_service.rb"

RSpec.describe MovieApiService do

  it "should exist" do
    api = MovieApiService.new
    api.should be_an_instance_of MovieApiService
  end

  describe "methods" do
    it "conn" do
      api = MovieApiService.new
      expect(api.conn).to eq("hello")
    end
  end

end
