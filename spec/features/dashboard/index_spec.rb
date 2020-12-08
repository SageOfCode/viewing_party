require 'rails_helper'

RSpec.describe "as a logged in user" do
  describe "when I visit the homepage" do
     it "I see a button to find movies, a friends section, and a viewing party section" do
       user = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)

       visit "/login"

       fill_in :email, with: "grant@awesomeguy.com"
       fill_in :password, with: "password"

       click_button "Login"

       expect(current_path).to eq("/dashboard")

       expect(page).to have_content("Welcome #{user.username}!")
       expect(page).to have_button("Discover Movies")
       expect(page).to have_content("Friends")
       expect(page).to have_content("Viewing Parties")
    end
      it 'I can add and view my friends' do
        user1 = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)
        user2 = User.create!(username: "Jose", email: "jose@gmail.com", password: "password", role: 1)

        visit "/login"

        fill_in :email, with: "grant@awesomeguy.com"
        fill_in :password, with: "password"

        click_button "Login"

        expect(page).to have_content("You currently have no friends")

        fill_in :user_email, with: "jose@gmail.com"
        click_button "Add Friend"

        expect(page).to have_content("#{user2.username}")
      end

      it "I recieve message if friend does not exist" do
        user1 = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)

        visit "/login"

        fill_in :email, with: "grant@awesomeguy.com"
        fill_in :password, with: "password"

        click_button "Login"

        fill_in :user_email, with: "jose@gmail.com"
        click_button "Add Friend"

        expect(page).to have_content("User does not Exist")
      end
    end
  end
