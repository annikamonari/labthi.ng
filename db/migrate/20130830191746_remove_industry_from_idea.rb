class RemoveIndustryFromIdea < ActiveRecord::Migration
  def up
    remove_column :ideas, :industry
  end

  def down
    add_column :ideas, :industry, :string
  end
end
