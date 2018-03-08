class Category < ApplicationRecord
  has_ancestry

  has_many :stores

  # subtree 包含自身和所有子孙
  def subtree_stores
    sql = subtree.joins(:stores).select('stores.*').to_sql
    Store.find_by_sql(sql)
  end
end
