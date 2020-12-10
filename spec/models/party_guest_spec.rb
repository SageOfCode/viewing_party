require 'rails_helper'

RSpec.describe PartyGuest, type: :model do

  describe "Methods" do
    it ".add_party_guest" do
      movie = Movie.create!(title: "Fight Club", api_id: 1111, duration: 120)
      user = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)
      user_2 = User.create!(username: "Jose", email: "Jose@amazingguy.com", password: "password", role: 1)
      user_3 = User.create!(username: "Sage", email: "sage@coolguy.com", password: "password", role: 1)
      user.add_friends(user.id, user_2.id)
      user.add_friends(user.id, user_3.id)

      friend = user.friendships.first.friend_id
      friends = ["", friend]
      party = MovieParty.create!(movie_id: movie.id, user_id: user.id, date: "12/20/20", time: "12:00")
      PartyGuest.add_party_guest(friends, party)
      expected = PartyGuest.first.friendship.friend_id
      expect(friend).to eq(expected)
    end
  end
end
