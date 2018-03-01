class Shop < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :region, optional: true
  has_one :shop_detail
  has_many :comments

  enum status: { status_created: 0, status_pended: 1, status_checked: 2, status_failed: 3 }
  ransacker :status, formatter: proc { |v| statuses[v] }
end
