class Category < ApplicationRecord
  mount_uploader :logo, ImageUploader
  has_ancestry
  acts_as_list scope: [:ancestry]

  has_and_belongs_to_many :stores
  # has_many :products, :through => :stores

  # subtree 包含自身和所有子孙
  def subtree_stores
    Store.joins(:categories).merge(subtree)
  end
end
