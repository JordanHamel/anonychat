class RemoveUserId < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id
    remove_column :comments, :user_id
    drop_table :users
  end
end
