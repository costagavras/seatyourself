class FixCategoryIdName < ActiveRecord::Migration[5.2]
  def up
    remove_column :restaurants, :category, :string
    add_column :restaurants, :category_id, :string
  end

  def down
    remove_column :restaurants, :category_id, :string
    add_column :restaurants, :category, :string
  end

end
