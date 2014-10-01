class AddEquityToParts < ActiveRecord::Migration
  def change
    add_column :parts, :equity, :string
  end
end
