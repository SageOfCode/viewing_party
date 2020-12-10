require 'rails_helper'

RSpec.describe "as a user" do
  it "can access movie search option through the discover movies button" do
    user = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)

    visit "/login"

    fill_in :email, with: "grant@awesomeguy.com"
    fill_in :password, with: "password"

    click_button "Login"

    expect(current_path).to eq("/dashboard")

    click_button "Discover Movies"

    expect(current_path).to eq("/discover")
  end
end
