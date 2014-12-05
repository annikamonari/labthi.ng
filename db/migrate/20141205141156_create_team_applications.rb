class CreateTeamApplications < ActiveRecord::Migration
  def change
    create_table :team_applications do |t|
      t.text :pitch
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
