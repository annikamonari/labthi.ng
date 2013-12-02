class RemoveMeritGem < ActiveRecord::Migration
  def change
  	drop_table :merit_actions
  	drop_table :merit_activity_logs
  	drop_table :merit_score_points
  	drop_table :merit_scores
  end
end
