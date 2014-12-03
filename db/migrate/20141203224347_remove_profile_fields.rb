class RemoveProfileFields < ActiveRecord::Migration
  def change
    remove_column :profiles, :age, :integer
    remove_column :profiles, :profession, :string
  end
end
