class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.text :brief
      t.integer :answers_expected
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
