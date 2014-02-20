class CreateIdeaRelationships < ActiveRecord::Migration
  def change
    create_table :idea_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :idea_relationships, :follower_id
    add_index :idea_relationships, :followed_id
    add_index :idea_relationships, [:follower_id,:followed_id], unique: true
  end
end
