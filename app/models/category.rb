class Category < ApplicationRecord
  has_ancestry

  has_and_belongs_to_many :stores
  # has_many :products, :through => :stores
  has_many :products

  # subtree 包含自身和所有子孙
  def subtree_stores
    Store.joins(:categories).merge(subtree)
  end
end
