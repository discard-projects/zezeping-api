class Product < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at])

  mount_uploader :image, ImageUploader

  belongs_to :store, counter_cache: true
  belongs_to :product_category, counter_cache: true
  has_many :comments, :as => :commentable
  has_many :attachment_images, as: :owner, dependent: :destroy
end
