class CreateRestaurantsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_users do |t|
      t.integer :user_id
      t.integer :restaurant_id
    end
  end
end
