class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.text :value
      t.references :user, index: true
      t.references :component, index: true

      t.timestamps
    end
  end
end
