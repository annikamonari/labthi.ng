class RenameSolutionsToAnswers < ActiveRecord::Migration
  def up
		rename_table :solutions, :answers
	end

	def down
		rename_table :answers, :solutions
	end
end
