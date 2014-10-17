class AddUserIdToAdminTasks < ActiveRecord::Migration
  def change
    add_column :admin_tasks, :user_id, :integer
  end
end
