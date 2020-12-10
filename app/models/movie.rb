class Movie < ApplicationRecord
  validates_presence_of :title, :api_id, :duration, require: true
  has_many :movie_parties
  has_many :party_guests
  has_many :users, through: :party_guests
end
