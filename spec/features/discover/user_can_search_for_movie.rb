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

    expect(current_path).to eq("/dashboard")

    click_button "Discover Movies"

    expect(current_path).to eq("/discover")

    click_button "Find Top Rated Movies"
    save_and_open_page

    expect(page).to have_css('.movies')
    movies = find('.movies').text
    expect(movies).to_not be_empty
  end
end
