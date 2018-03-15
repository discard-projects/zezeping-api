class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category, optional: true
  has_many :comments, :as => :commentable
  has_many :attachment_images, as: :owner, dependent: :destroy
end
