class CreateMovieParty < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_parties do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.string :date
      t.string :time
    end
  end
end
