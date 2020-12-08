require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit '/registration'" do
    it 'I see a form to register' do

      visit '/registration'


      fill_in :username, with: "Steve123"
      fill_in :email, with: "steve@test.com"
      fill_in :password, with: "Stev3"
      fill_in :confirm_password, with: "Stev3"

      expect(page).to have_button("Register")

      click_button "Register"

      expect(current_path).to eq("/dashboard")
    end
  end
end
