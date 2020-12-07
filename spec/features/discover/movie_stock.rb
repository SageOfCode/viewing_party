require 'rails_helper'

RSpec.describe "as a user" do
  it "can access movies through the find movies button" do
    user = User.create!(email: "grant@awesomeguy.com", password: "password", role: 1)

    visit "/login"

    fill_in :email, with: "grant@awesomeguy.com"
    fill_in :password, with: "password"

    click_button "Login"

    expect(current_path).to eq("/dashboard")

    click_button "Find Movies"

    expect(current_path).to eq("/movies")
  end
end
