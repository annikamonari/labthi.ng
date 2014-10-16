class CreateTaskComments < ActiveRecord::Migration
  def change
    create_table :task_comments do |t|
      t.integer :admin_task_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
