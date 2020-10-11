class RemoveUserFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :events, :users
    remove_index :events, :user_id
    remove_reference :events, :user, null: false
  end
end
