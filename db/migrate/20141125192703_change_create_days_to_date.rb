class ChangeCreateDaysToDate < ActiveRecord::Migration
  def change
    remove_column :ideas, :create_days, :integer
    add_column :ideas, :create_days, :date
  end
end
