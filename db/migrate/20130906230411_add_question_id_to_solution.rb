class AddQuestionIdToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :question_id, :integer
  end
end