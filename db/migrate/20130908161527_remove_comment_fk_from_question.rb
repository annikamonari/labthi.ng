class RemoveCommentFkFromQuestion < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
    	t.remove_foreign_key :questions
  	end
  end
end
