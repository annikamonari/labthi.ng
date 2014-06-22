class AddIdeaBuildToComponents < ActiveRecord::Migration
  def change
    add_reference :components, :idea_build, index: true
  end
end
