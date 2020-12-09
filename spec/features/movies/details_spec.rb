require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "When I visit the movie's detail page" do
    it 'I should see a movies info' do
      json_response = File.read("spec/fixtures/movie_search.json")

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
         with(
           headers: {
          'X-Api-Key'=>ENV["MOVIE_API_KEY"]
           }).
      to_return(status: 200, body: json_response, headers: {})

      user = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password")

      visit "/login"

      fill_in :email, with: "grant@awesomeguy.com"
      fill_in :password, with: "password"

      click_button "Login"

      visit "/"
      click_button "Discover Movies"
      
      click_button "Find Top Rated Movies"
      save_and_open_page

      click_link "Vampire Virus"

      expect(current_path).to eq("/movies/#{movie[1][:id]}")
      expect(page).to have_content("Vampire Virus")
    end
  end
end 