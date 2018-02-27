class Shop < ApplicationRecord

  store :rank_detail, :accessors => [:rank_taste, :rank_env, :rank_service]
  after_initialize :initialize_defaults, :if => :new_record?

  belongs_to :category
  belongs_to :region
  has_one :shop_detail
  has_many :comments

  private

  def initialize_defaults
    self.rank_taste ||= 0.0
    self.rank_env ||=  0.0
    self.rank_service ||=  0.0
  end
end
