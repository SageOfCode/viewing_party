require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "Relationships" do
    it {should have_many(:friendships)}
    it {should have_many(:friends).through(:friendships)}
    it {should have_many(:movie_parties)}
  end

  describe "Methods" do
    it ".add_friends" do
      user = User.create!(username: "Grant", email: "grant@awesomeguy.com", password: "password", role: 1)
      user_2 = User.create!(username: "Jose", email: "Jose@amazingguy.com", password: "password", role: 1)
      user.add_friends(user.id, user_2.id)
      expected = [user_2]
      expect(user.friends).to eq(expected)
    end
  end
end
