class AddrestaurantName < ActiveRecord::Migration[5.2]
  def up
    add_column :restaurants, :name, :string
    add_column :restaurants, :picture_url, :string
  end

  def down
    remove_column :restaurants, :name, :string
    remove_column :restaurants, :picture_url, :string
  end
end
