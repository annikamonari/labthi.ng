class CreateBuyPhaseVotes < ActiveRecord::Migration
  def change
    create_table :buy_phase_votes do |t|
      t.integer :idea_id
      t.integer :user_id
      t.boolean :buy

      t.timestamps
    end
  end
end
