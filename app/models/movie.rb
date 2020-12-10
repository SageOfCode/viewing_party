class Movie < ApplicationRecord
  validates_presence_of :title, :api_id, :duration, require: true
  has_many :movie_parties
end
