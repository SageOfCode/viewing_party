require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:api_id)}
    it {should validate_presence_of(:duration)}
  end

  describe "Relationships" do
    it {should have_many(:movie_parties)}
  end
end
