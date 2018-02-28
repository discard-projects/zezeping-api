class Shop < ApplicationRecord
  # 口味 环境 服务
  store :rank_detail, :accessors => [:rank_taste, :rank_env, :rank_service]
  after_initialize :initialize_defaults, :if => :new_record?

  belongs_to :category
  belongs_to :region
  has_one :shop_detail
  has_many :comments

  enum status: { status_created: 0, status_pended: 1, status_checked: 2, status_failed: 3 }
  ransacker :status, formatter: proc { |v| statuses[v] }

  private

  def initialize_defaults
    self.rank_taste ||= 0.0
    self.rank_env ||=  0.0
    self.rank_service ||=  0.0
  end
end
