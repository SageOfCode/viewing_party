require 'rails_helper'

RSpec.describe "as a user" do
  describe "I can login" do
     it "can login a user" do
       user = User.create!(email: "grant@awesomeguy.com", password: "password", role: 1)

       visit "/login"

       fill_in :email, with: "grant@awesomeguy.com"
       fill_in :password, with: "password"

       click_button "Login"

       expect(current_path).to eq("/dashboard")

       expect(page).to have_content("You're logged in as #{user.email}")
     end
     it "wrong username test" do
       user = User.create!(email: "grant@awesomeguy.com", password: "password")

       visit "/login"

       fill_in :email, with: "bob@awesomeguy.com"
       fill_in :password, with: "password"

       click_button "Login"

       expect(current_path).to_not eq("/dashboard")
       expect(current_path).to eq("/login")
       expect(page).to have_content("Email or Password is incorrect.")
     end
  end
end
