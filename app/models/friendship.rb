class Friendship < ApplicationRecord
  validates :user_1, :user_2, presence: true

  belongs_to :user 
  belongs_to :friend, class_name: "User"
end