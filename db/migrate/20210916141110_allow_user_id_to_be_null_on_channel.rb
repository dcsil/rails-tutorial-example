class AllowUserIdToBeNullOnChannel < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :channels, :users
    change_column :channels, :user_id, :bigint, null: true
  end
end
