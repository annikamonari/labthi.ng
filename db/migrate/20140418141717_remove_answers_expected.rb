class RemoveAnswersExpected < ActiveRecord::Migration
  def up
  	remove_column :questions, :answers_expected
  end
end
