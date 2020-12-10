require 'rails_helper'

RSpec.describe "as a logged in user" do
  describe "I visit the new viewing party page" do
    it 'I see a form to create a new viewing party' do
      VCR.use_cassette('movie_party') do
        user1 = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)
        user2 = User.create!(username: "Jose", email: "Jose@amazingguy.com", password: "password", role: 1)
        user3 = User.create!(username: "Sage", email: "sage@amazingguy.com", password: "password", role: 1)

        friendship = user1.friendships.create!(user_id: user1.id, friend_id: user2.id)
        friendship = user1.friendships.create!(user_id: user1.id, friend_id: user3.id)

        visit "/login"

        fill_in :email, with: "grant@awesomeguy.com"
        fill_in :password, with: "password"

        click_button "Login"

        visit "/party/650747/new"

        expect(page).to have_content("Movie Title")
        expect(page).to have_content("Duration of Party")
        expect(page).to have_content("Date")
        expect(page).to have_content("Start Time")
        expect(page).to have_content("Invite Friends")

        fill_in :date, with: "12/18/20"
        fill_in :start_time, with: "16:00"
        check "Jose"
        check "Sage"

        click_button "Create Party"

        expect(current_path).to eq("/dashboard")
      end
    end
  end
end

# As an authenticated user,
# When I visit the new viewing party page,
# I should see a form with the following:
#
#  Movie Title (that is un-editable)
#  Duration of Party with a default value of movie runtime in minutes
#  When: field to select date
#  Start Time: field to select time
#  Checkboxes next to each friend (if user has friends)
#  Button to create a party
# Details When the party is created, the authenticated user should be redirected back to the dashboard where the new event is shown. The event should also be seen by any friends that were invited when they log in.
