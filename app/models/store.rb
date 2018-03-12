class Store < ApplicationRecord
  mount_uploader :logo, ImageUploader

  enum status: { status_created: 0, status_pended: 1, status_checked: 2, status_failed: 3 }
  ransacker :status, formatter: proc { |v| statuses[v] }

  # belongs_to :category, optional: true
  has_and_belongs_to_many :categories
  belongs_to :region, optional: true
  has_many :comments, :as => :commentable
  has_many :attachment_images, as: :owner, dependent: :destroy
  has_one :store_detail, dependent: :destroy

  before_create :create_store_detail

  private

  def create_store_detail
    self.store_detail ||= StoreDetail.create
  end

end
