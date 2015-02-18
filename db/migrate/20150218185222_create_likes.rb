class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :model_name
      t.integer :model_id
      t.integer :user_id

      t.timestamps
    end
  end
end
