class Category < ApplicationRecord
  has_ancestry

  has_many :stores

  has_many :subtree_stores, through:

  # subtree 包含自身和所有子孙
  def subtree_stores
    Store.joins(:category).merge(subtree)
  end
end
