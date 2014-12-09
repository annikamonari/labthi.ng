class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :kind
      t.integer :user_id
      t.integer :kind_id

      t.timestamps
    end
  end
end
