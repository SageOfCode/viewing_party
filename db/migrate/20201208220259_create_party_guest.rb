class CreatePartyGuest < ActiveRecord::Migration[5.2]
  def change
    create_table :party_guests do |t|
      t.references :movie_party, foreign_key: true
      t.references :friendship, foreign_key: true
    end
  end
end
