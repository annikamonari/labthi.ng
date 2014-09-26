class AddStatusToParts < ActiveRecord::Migration
  def change
    add_column :parts, :status, :string
    add_column :parts, :button_status, :string
  end
end
