class AddTypeToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :kind, :string
  end
end
