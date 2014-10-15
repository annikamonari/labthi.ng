class CreateAdminTasks < ActiveRecord::Migration
  def change
    create_table :admin_tasks do |t|
      t.integer :admin_id
      t.integer :part_id
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
