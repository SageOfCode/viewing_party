require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit '/registration'" do 
    it 'I see a form to register' do

      visit '/registration'
# save_and_open_page
     
      # fill_in :username, with: "Steve"
      fill_in :email, with: "steve@test.com"
      fill_in :password, with: "Stev3"
      fill_in :confirm_password, with: "Stev3"
        # fill_in "user_password_digest", with: "Stev3"
      
      expect(page).to have_button("Register")

      click_button "Register"

      expect(current_path).to eq("/dashboard")
    end
  end
end 