class CreateStrikes < ActiveRecord::Migration
  def change
    create_table :strikes do |t|
      t.integer :user_id
      t.integer :idea_build_id
      t.integer :strike_number
      t.integer :voter_ids

      t.timestamps
    end
  end
end
