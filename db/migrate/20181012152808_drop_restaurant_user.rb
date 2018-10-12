class DropRestaurantUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :restaurants_users
  end
end
