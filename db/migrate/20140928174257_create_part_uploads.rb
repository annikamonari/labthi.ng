class CreatePartUpload < ActiveRecord::Migration
  def change
    create_table :part_uploads do |t|
      t.integer :part_id
      t.string :image

      t.timestamps
    end
  end
end
