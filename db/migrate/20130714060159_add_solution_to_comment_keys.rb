class AddSolutionToCommentKeys < ActiveRecord::Migration
  def change
    add_foreign_key "comments", "solutions", :name => "comments_solution_id_fk"
  end
end
