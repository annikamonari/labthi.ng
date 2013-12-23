class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :int, default: 0
  end
end
