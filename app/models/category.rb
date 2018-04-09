class Category < ApplicationRecord
  include Footprintable
  has_footprint(except: [:updated_at, :created_at])

  mount_uploader :logo, ImageUploader
  has_ancestry
  acts_as_list scope: [:category, :ancestry]

  has_and_belongs_to_many :stores
  has_many :posts
  has_many :product_categories
  has_many :products, :through => :product_categories

  enum category: { category_store: 0, category_post: 1 }
  ransacker :category, formatter: proc { |v| categories[v] }

  validates :category, inclusion: {in: ["category_store", "category_post"]}

  # subtree 包含自身和所有子孙
  def subtree_stores
    Store.joins(:categories).merge(subtree)
  end

  def category_parents_names
    self.ancestors.pluck(:name).push(self.name).join('/')
  end
end
