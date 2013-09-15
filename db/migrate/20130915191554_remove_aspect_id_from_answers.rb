class RemoveAspectIdFromAnswers < ActiveRecord::Migration
  def self.up
  	remove_column :answers, :aspect_id
	end
	def self.down
  	add_column :answers, :aspect_id, :integer
	end
end
