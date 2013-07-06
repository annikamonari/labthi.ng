class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "aspects", "ideas", :name => "aspects_idea_id_fk"
  end
end
