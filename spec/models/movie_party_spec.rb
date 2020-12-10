require 'rails_helper'

RSpec.describe MovieParty, type: :model do
  describe "Relationships" do
    it {should belong_to(:movie)}
    it {should belong_to(:user)}
  end
end
