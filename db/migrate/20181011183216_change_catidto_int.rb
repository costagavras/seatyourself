class ChangeCatidtoInt < ActiveRecord::Migration[5.2]
  def up
    change_column :restaurants, :category_id, :integer
  end

  def down
    change_column :restaurants, :category_id, :string
  end
end
