class AttachmentImage < ApplicationRecord
  mount_uploader :file, ImageUploader

  belongs_to :owner, polymorphic: true
end
