class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :phase
      t.text :brief
      t.string :image
      t.boolean :active
      t.string :industry

      t.timestamps
    end
  end
end
