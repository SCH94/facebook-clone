class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
    add_index :friendships, :from_id
    add_index :friendships, :to_id
  end
end
