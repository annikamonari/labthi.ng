class AddAspectIdToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :aspect_id, :integer
  end
end
