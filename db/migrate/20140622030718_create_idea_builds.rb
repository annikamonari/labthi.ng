class CreateIdeaBuilds < ActiveRecord::Migration
  def change
    create_table :idea_builds do |t|
      t.references :idea, index: true

      t.timestamps
    end
  end
end
