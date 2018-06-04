class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :acceptor_id
      t.integer :sender_id
      t.string :status

      t.timestamps
    end
  end
end
