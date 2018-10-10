class ChangeColRestaurants < ActiveRecord::Migration[5.2]
    def up
      change_column :restaurants, :opening_hours, :integer
      change_column :restaurants, :closing_hours, :integer
    end

    def down
      change_column :restaurants, :opening_hours, :time
      change_column :restaurants, :closing_hours, :time
    end
end
