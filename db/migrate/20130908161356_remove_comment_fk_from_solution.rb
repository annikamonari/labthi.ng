class RemoveCommentFkFromSolution < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
    	t.remove_foreign_key :solutions
  	end
  end
end
