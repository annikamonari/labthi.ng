class CreateLabEvaluations < ActiveRecord::Migration
  def change
    create_table :lab_evaluations do |t|
      t.references :evaluator, index: true
      t.references :content_creator, index: true
      t.references :content, polymorphic: true, index: true
      t.integer :value

      t.timestamps
    end
  end
end
