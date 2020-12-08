class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend

  has_secure_password

  enum role: ["guest", "user"]

  def add_friends(user_id, friend_id)
    # require 'pry'; binding.pry
    Friendship.create(user_1: user_id,
                      user_2: friend_id)
    Friendship.create(user_1: friend_id,
                      user_2: user_id)
  end

  # def all_friends 
  #   require 'pry'; binding.pry
  # end
end
