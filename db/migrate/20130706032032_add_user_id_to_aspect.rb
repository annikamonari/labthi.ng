class AddUserIdToAspect < ActiveRecord::Migration
  def change
    add_column :aspects, :user_id, :integer
  end
end
