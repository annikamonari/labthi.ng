class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
      t.text :brief

      t.timestamps
    end
  end
end
