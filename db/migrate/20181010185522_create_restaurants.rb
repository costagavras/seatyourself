class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :capacity
      t.time :opening_hours
      t.time :closing_hours
      t.string :address
      t.integer :price_range
      t.integer :neighbourhood_id
      t.text :summary
      t.integer :category
      t.text :menu

      t.timestamps
    end
  end
end
