class CreateFriendRequestsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.references :requester, foreign_key: false
      t.references :requested, foreign_key: false
  end
end
