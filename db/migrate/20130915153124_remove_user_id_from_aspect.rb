class RemoveUserIdFromAspect < ActiveRecord::Migration
  def self.up
  	remove_column :aspects, :user_id
	end
	def self.down
  	add_column :aspects, :user_id, :integer
	end
end
