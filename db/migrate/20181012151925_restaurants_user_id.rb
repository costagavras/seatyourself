class RestaurantsUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :user_id, :integer, default: nil
  end
  
  def up
    drop_table :restaurants_users    
  end

  def down
    create_table :restaurants_users do |t|
      t.integer :user_id
      t.integer :restaurant_id
    end
  end
end
