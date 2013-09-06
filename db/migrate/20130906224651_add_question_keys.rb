class AddQuestionKeys < ActiveRecord::Migration
  def change
    add_foreign_key "profiles", "users", :name => "profiles_user_id_fk"
    add_foreign_key "questions", "ideas", :name => "questions_idea_id_fk"
    add_foreign_key "questions", "users", :name => "questions_user_id_fk"
    add_foreign_key "solutions", "questions", :name => "solutions_question_id_fk"
    add_foreign_key "taggings", "tags", :name => "taggings_tag_id_fk"
  end
end
