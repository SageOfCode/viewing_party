class AddTimeToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_parties, :time, :string
  end
end
