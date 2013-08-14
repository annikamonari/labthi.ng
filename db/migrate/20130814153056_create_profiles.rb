class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :website
      t.integer :age
      t.string :profession
      t.string :country
      t.text :about

      t.timestamps
    end
    add_index :profiles, [:user_id]
  end
end
