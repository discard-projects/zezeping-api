json.(@store, :id, :name, :products_count)
json.product_categories @store.product_categories.where('products_count > 0') do |product_category|
  json.(product_category, :id, :name)

  json.products product_category.products do |product|
    json.(product, :id, :name, :price, :rank)
    json.image product.image
    json.product_category_id product_category.id
  end
end