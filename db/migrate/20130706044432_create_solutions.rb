class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :brief

      t.timestamps
    end
  end
end
