require 'rails_helper'

RSpec.describe "user can search movies through the find movies button" do
  before :each do
    user = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)

    visit "/login"

    fill_in :email, with: "grant@awesomeguy.com"
    fill_in :password, with: "password"

    click_button "Login"
  end

  it "user can discover top 40 movies and see results on page" do
    VCR.use_cassette('top_movies') do
      expect(current_path).to eq("/dashboard")

      click_button "Discover Movies"

      expect(current_path).to eq("/discover")

      click_button "Find Top Rated Movies"

      expect(page).to have_content("Gabriel's Inferno Part III")
      expect(page).to have_content("Your Name.")
      expect(page).to have_content("Parasite")
    end
  end
end
