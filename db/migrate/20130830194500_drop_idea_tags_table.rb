class DropIdeaTagsTable < ActiveRecord::Migration
  def up
    drop_table :idea_tags
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end