class AddContentTypeToLabEvaluations < ActiveRecord::Migration
  def change
    add_column :lab_evaluations, :content_type, :string
  end
end
