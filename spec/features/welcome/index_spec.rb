require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit '/'" do
    it 'I see a welcome message' do
      visit '/'

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("This application allows you and your friends to have a movie watch party during a pandemic, and give you the comfort to watch from home.")
    end
    it 'I see a button to login and link to register' do
      visit '/'

      expect(page).to have_button("Login")
      expect(page).to have_link("Register")
    end
  end

  describe "when user is already logged in as a current_user" do
    it "will not display login or register button" do
      user = User.create!(email: "grant@awesomeguy.com", password: "password")

      visit "/login"

      fill_in :email, with: "grant@awesomeguy.com"
      fill_in :password, with: "password"

      click_button "Login"

      visit "/"

      expect(page).to_not have_link('Register')
      expect(page).to_not have_button('Login')
    end
  end
end
