class AddKind2IdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :kind_2_id, :integer
  end
end
