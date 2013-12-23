class RemoveActiveRecordReputationSystem < ActiveRecord::Migration
  def change
    drop_table :rs_evaluations
    drop_table :rs_reputations
    drop_table :rs_reputation_messages
  end
end
