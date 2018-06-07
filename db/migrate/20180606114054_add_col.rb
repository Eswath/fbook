class AddCol < ActiveRecord::Migration[5.2]
  def change
  	add_column :likes, :user_ids, :string
  end
end
