require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "When I visit the movie's detail page" do
    it 'I should see a movies info' do
      VCR.use_cassette('movie_details') do 
        user = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password")

        visit "/login"

        fill_in :email, with: "grant@awesomeguy.com"
        fill_in :password, with: "password"

        click_button "Login"

        visit "/"
        click_button "Discover Movies"
        
        click_button "Find Top Rated Movies"
        
        fill_in "movie", with: "Historias lamentables"
        click_button "Find Movies"

        click_link "Historias lamentables"

        expect(current_path).to eq "/movies/650747"
        expect(page).to have_content("Historias lamentables")
      end 
    end
  end
end 