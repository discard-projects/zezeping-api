class AttachmentImage < ApplicationRecord
  mount_uploader :file, ImageUploader
end
