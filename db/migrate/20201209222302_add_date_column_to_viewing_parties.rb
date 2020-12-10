class AddDateColumnToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_parties, :date, :string
  end
end
