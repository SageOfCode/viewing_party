class RenameUser1ToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :friendships, :user_1, :user_id
  end
end
