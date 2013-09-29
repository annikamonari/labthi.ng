class FixSolutionsImageColumnName < ActiveRecord::Migration
  def change
  	rename_column :solutions, :photo, :image
  end
end
