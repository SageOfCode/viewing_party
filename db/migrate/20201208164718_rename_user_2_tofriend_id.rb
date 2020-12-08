class RenameUser2TofriendId < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :user_2, :friend_id
  end
end
