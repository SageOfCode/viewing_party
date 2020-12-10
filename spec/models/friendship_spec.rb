require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "Relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:friend)}
    it {should have_many(:party_guests)}
  end
end
