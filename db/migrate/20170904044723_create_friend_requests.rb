class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :friend_requests do |t|
      t.integer :requestor_id, index: true
      t.integer :requested_id, index: true
      t.string :status

      t.timestamps
    end
  end
end
