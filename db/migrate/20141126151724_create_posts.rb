class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :idea_build_id
      t.integer :user_id
      t.string :title
      t.string :kind
      t.text :content
      t.string :image
      t.string :status
      t.integer :likes

      t.timestamps
    end
  end
end
