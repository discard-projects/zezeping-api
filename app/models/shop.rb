class Shop < ApplicationRecord

  mount_uploader :logo, ImageUploader

  belongs_to :category, optional: true
  belongs_to :region, optional: true
  has_one :shop_detail, dependent: :destroy
  has_many :comments
  has_many :attachment_images, as: :owner, dependent: :destroy

  enum status: { status_created: 0, status_pended: 1, status_checked: 2, status_failed: 3 }
  ransacker :status, formatter: proc { |v| statuses[v] }

  before_create :create_shop_detail

  private

  def create_shop_detail
    self.shop_detail = ShopDetail.create
  end
end
