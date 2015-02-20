class ChatAttachment < ActiveRecord::Base
  mount_uploader :item, AttachmentUploader
  validates_presence_of :item, :chat_id
end
