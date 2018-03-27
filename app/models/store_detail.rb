class StoreDetail < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at])

  mount_uploader :wechat_qrcode, ImageUploader

  after_initialize :initialize_defaults, :if => :new_record?

  # 口味 环境 服务
  store :rank_detail, :accessors => [:rank_taste, :rank_env, :rank_service]
  serialize :phones, Array
  store :extra_contact_detail, :accessors => [:qq]

  belongs_to :store

  private

  def initialize_defaults
    self.rank_taste ||= 0.0
    self.rank_env ||=  0.0
    self.rank_service ||=  0.0
  end
end
