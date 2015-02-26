class AddLinkedinToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :linkedin, :string
    add_column :profiles, :skills, :text
  end
end
