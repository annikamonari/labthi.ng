class AddCommentableToComments < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
  		t.rename :solution_id, :commentable_id
  		t.string :commentable_type
  	end
  end
end
