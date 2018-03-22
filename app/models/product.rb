class Product < ApplicationRecord
  belongs_to :store
  belongs_to :product_category
  has_many :comments, :as => :commentable
  has_many :attachment_images, as: :owner, dependent: :destroy
end
