require 'rails_helper'

RSpec.describe "as a logged in user" do
     it "when visiting the dashboard contains a button to find movies, a friends section, and a viewing party section" do
       user = User.create!(email: "grant@awesomeguy.com", password: "password", role: 1)

       visit "/login"

       fill_in :email, with: "grant@awesomeguy.com"
       fill_in :password, with: "password"

       click_button "Login"

       expect(current_path).to eq("/dashboard")

       expect(page).to have_content("Welcome #{user.email}!")
       expect(page).to have_button("Find Movies")
       expect(page).to have_content("Friends")
       expect(page).to have_content("Viewing Parties")
     end
   end
