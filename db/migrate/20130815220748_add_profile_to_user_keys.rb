class AddProfileToUserKeys < ActiveRecord::Migration
  def change
    add_foreign_key "profiles", "users", :name => "profiles_user_id_fk"
  end
end
