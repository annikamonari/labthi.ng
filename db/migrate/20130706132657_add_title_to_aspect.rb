class AddTitleToAspect < ActiveRecord::Migration
  def change
    add_column :aspects, :title, :string
  end
end
