class AddProductsCountToProductCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :product_categories, :products_count, :integer, default: 0
  end
end
