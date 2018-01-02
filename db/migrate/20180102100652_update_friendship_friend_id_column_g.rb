class UpdateFriendshipFriendIdColumnG < ActiveRecord::Migration[5.1]
  def change
    change_column :friendships, :friend_id, :integer
  end
end
