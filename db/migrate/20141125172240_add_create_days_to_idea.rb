class AddCreateDaysToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :create_days, :integer
  end
end
