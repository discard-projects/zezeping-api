class Subject < ApplicationRecord
  belongs_to :user
  has_many :discussions, :as => :discussable
  has_many :attachment_images, as: :owner, dependent: :destroy
end
