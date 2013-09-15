class RemoveIdeaIdFromAspect < ActiveRecord::Migration
  def self.up
  	remove_column :aspects, :idea_id
	end
	def self.down
  	add_column :aspects, :idea_id, :integer
	end
end
