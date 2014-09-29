class PartUpload < ActiveRecord::Base
  mount_uploader :image, ComponentUploader
  belongs_to :part
end
