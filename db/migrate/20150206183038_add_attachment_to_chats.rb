class AddAttachmentToChats < ActiveRecord::Migration
  def change
    add_column :chats, :attachment, :string
  end
end
