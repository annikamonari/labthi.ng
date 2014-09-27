class AddStatusToParts < ActiveRecord::Migration
  def change
    add_column :parts, :status, :string
  end
end
