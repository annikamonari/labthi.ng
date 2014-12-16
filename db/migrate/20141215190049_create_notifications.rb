class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :kind
      t.integer :kind_id
      t.integer :user_id
      t.boolean :read

      t.timestamps
    end
  end
end
