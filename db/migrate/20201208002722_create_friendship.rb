class CreateFriendship < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_1
      t.integer :user_2
    end
  end
end
