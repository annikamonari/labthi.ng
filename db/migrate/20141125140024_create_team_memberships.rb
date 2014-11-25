class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.integer :user_id
      t.integer :idea_build_id

      t.timestamps
    end
  end
end
