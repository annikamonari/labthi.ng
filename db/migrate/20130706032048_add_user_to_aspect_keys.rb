class AddUserToAspectKeys < ActiveRecord::Migration
  def change
    add_foreign_key "aspects", "users", :name => "aspects_user_id_fk"
  end
end
