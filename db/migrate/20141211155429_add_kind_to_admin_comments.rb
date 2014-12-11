class AddKindToAdminComments < ActiveRecord::Migration
  def change
    add_column :task_comments, :kind, :string
    rename_column :task_comments, :admin_task_id,  :kind_id
  end
end
