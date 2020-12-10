class MovieParty < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
