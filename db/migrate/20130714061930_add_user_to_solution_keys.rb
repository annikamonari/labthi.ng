class AddUserToSolutionKeys < ActiveRecord::Migration
  def change
    add_foreign_key "solutions", "users", :name => "solutions_user_id_fk"
  end
end
