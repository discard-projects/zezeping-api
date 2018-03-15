class Moment < ApplicationRecord
  belongs_to :store
  has_many :comments, :as => :commentable
  has_many :attachment_images, as: :owner, dependent: :destroy
end
