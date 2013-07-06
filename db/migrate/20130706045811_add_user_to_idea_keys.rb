class AddUserToIdeaKeys < ActiveRecord::Migration
  def change
    add_foreign_key "ideas", "users", :name => "ideas_user_id_fk"
    add_foreign_key "solutions", "aspects", :name => "solutions_aspect_id_fk"
  end
end
