class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :brief
      t.references :aspect, index: true
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
