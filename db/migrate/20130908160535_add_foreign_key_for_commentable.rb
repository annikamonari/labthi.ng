class AddForeignKeyForCommentable < ActiveRecord::Migration
  def change
  	add_foreign_key "comments", "questions", :name => "comments_question_id_fk", :column => "commentable_id"
  end
end
