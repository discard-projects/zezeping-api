class Banner < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at])

  mount_uploader :image, ImageUploader
end
