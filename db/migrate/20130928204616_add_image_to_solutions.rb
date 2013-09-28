class AddImageToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :photo, :string
  end
end
