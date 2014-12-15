class AddColumnsToChats < ActiveRecord::Migration
  def change
    add_column :chats, :kind, :string
    add_column :chats, :kind_id, :integer
    add_column :chats, :read_at, :text, array: true, default: []
  end
end
