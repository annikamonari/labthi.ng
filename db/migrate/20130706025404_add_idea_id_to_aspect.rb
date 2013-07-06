class AddIdeaIdToAspect < ActiveRecord::Migration
  def change
    add_column :aspects, :idea_id, :integer
  end
end
