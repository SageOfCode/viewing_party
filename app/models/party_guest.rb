class PartyGuest < ApplicationRecord
  belongs_to :friendship
  belongs_to :movie_party

  def self.add_party_guest(friends, movie_party)
    friends.shift
    friends.each do |friend|
      friendship = Friendship.find_by(friend_id: friend)
      create!(movie_party_id: movie_party.id, friendship_id: friendship.id)
    end
  end
end
